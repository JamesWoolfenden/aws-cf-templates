'use strict';
const AWS = require('aws-sdk');
const ecs = new AWS.ECS({apiVersion: '2014-11-13'});
const sqs = new AWS.SQS({apiVersion: '2012-11-05'});
const asg = new AWS.AutoScaling({apiVersion: '2011-01-01'});
const cluster = process.env.CLUSTER;
const queueUrl = process.env.QUEUE_URL;
const drainingTimeout = process.env.DRAINING_TIMEOUT;
async function getContainerInstanceArn(ec2InstanceId) {
  console.log(`getContainerInstanceArn(${[...arguments].join(', ')})`);
  const listResult = await ecs.listContainerInstances({cluster: cluster, filter: `ec2InstanceId == '${ec2InstanceId}'`}).promise();
  return listResult.containerInstanceArns[0];
}
async function drainInstance(ciArn) {
  console.log(`drainInstance(${[...arguments].join(', ')})`);
  await ecs.updateContainerInstancesState({cluster: cluster, containerInstances: [ciArn], status: 'DRAINING'}).promise();
}
async function wait(ciArn, asgName, lchName, lcaToken, terminateTime) {
  console.log(`wait(${[...arguments].join(', ')})`);
  const payload = {
    Service: 'DrainInstance',
    Event: 'custom:DRAIN_WAIT',
    ContainerInstanceArn: ciArn,
    AutoScalingGroupName: asgName,
    LifecycleHookName: lchName,
    LifecycleActionToken: lcaToken,
    TerminateTime: terminateTime
  };
  await sqs.sendMessage({
    QueueUrl: queueUrl,
    DelaySeconds: 60,
    MessageBody: JSON.stringify(payload)
  }).promise();
}
async function countTasks(ciArn) {
  console.log(`countTasks(${[...arguments].join(', ')})`);
  const listResult = await ecs.listTasks({cluster: cluster, containerInstance: ciArn}).promise();
  return listResult.taskArns.length;
}
async function terminateInstance(asgName, lchName, lcaToken) {
  console.log(`terminateInstance(${[...arguments].join(', ')})`);
  await asg.completeLifecycleAction({
    AutoScalingGroupName: asgName,
    LifecycleHookName: lchName,
    LifecycleActionToken: lcaToken,
    LifecycleActionResult: 'CONTINUE'
  }).promise();
}
async function heartbeat(asgName, lchName, lcaToken) {
  console.log(`heartbeat(${[...arguments].join(', ')})`);
  await asg.recordLifecycleActionHeartbeat({
    AutoScalingGroupName: asgName,
    LifecycleHookName: lchName,
    LifecycleActionToken: lcaToken
  }).promise();
}
exports.handler = async function(event, context) {
  console.log(`Invoke: ${JSON.stringify(event)}`);
  const body = JSON.parse(event.Records[0].body); // batch size is 1
  if (body.Service === 'AWS Auto Scaling' && body.Event === 'autoscaling:TEST_NOTIFICATION') {
    console.log('Ignore autoscaling:TEST_NOTIFICATION')
  } else if (body.Service === 'AWS Auto Scaling' && body.LifecycleTransition === 'autoscaling:EC2_INSTANCE_TERMINATING') {
    const lcaToken = body.LifecycleActionToken;
    const ciArn = await getContainerInstanceArn(body.EC2InstanceId);
    await drainInstance(ciArn);
    await wait(ciArn, body.AutoScalingGroupName, body.LifecycleHookName, body.LifecycleActionToken, body.Time);
  } else if (body.Service === 'DrainInstance' && body.Event === 'custom:DRAIN_WAIT') {
    const taskCount = await countTasks(body.ContainerInstanceArn);
    if (taskCount === 0) {
      await terminateInstance(body.AutoScalingGroupName, body.LifecycleHookName, body.LifecycleActionToken);
    } else {
      const actionDuration = (Date.now() - new Date(body.TerminateTime).getTime()) / 1000;
      if (actionDuration < drainingTimeout) {
        await heartbeat(body.AutoScalingGroupName, body.LifecycleHookName, body.LifecycleActionToken);
        await wait(body.ContainerInstanceArn, body.AutoScalingGroupName, body.LifecycleHookName, body.LifecycleActionToken, body.TerminateTime);
      } else {
        console.log('Timeout for instance termination reached.');
        await terminateInstance(body.AutoScalingGroupName, body.LifecycleHookName, body.LifecycleActionToken);
      }
    }
  } else {
    console.log('Ignore unxpected event');
  }
};
