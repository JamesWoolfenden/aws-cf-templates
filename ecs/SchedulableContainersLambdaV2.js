'use strict';
const AWS = require('aws-sdk');
const ecs = new AWS.ECS({apiVersion: '2014-11-13'});
const cloudwatch = new AWS.CloudWatch({apiVersion: '2010-08-01'});
const CONTAINER_MAX_CPU = ${ContainerMaxCPU};
const CONTAINER_MAX_MEMORY = ${ContainerMaxMemory};
const CLUSTER = '';
const NAMESPACE = 'goformation-stack';
function list(nextToken) {
  return ecs.listContainerInstances({
    cluster: CLUSTER,
    maxResults: 1,
    nextToken: nextToken,
    status: 'ACTIVE'
  }).promise();
}
function describe(containerInstanceArns) {
  return ecs.describeContainerInstances({
    cluster: CLUSTER,
    containerInstances: containerInstanceArns
  }).promise();
}
function compute(totalSchedulableContainers, nextToken) {
  return list(nextToken)
    .then((list) => {
      return describe(list.containerInstanceArns)
        .then((data) => {
          const localSchedulableContainers = data.containerInstances
            .map((instance) => ({
              cpu: instance.remainingResources.find((resource) => resource.name === 'CPU').integerValue,
              memory: instance.remainingResources.find((resource) => resource.name === 'MEMORY').integerValue
            }))
            .map((remaining) => Math.min(Math.floor(remaining.cpu/CONTAINER_MAX_CPU), Math.floor(remaining.memory/CONTAINER_MAX_MEMORY)))
            .reduce((acc, containers) => acc + containers, 0);
          console.log(`localSchedulableContainers ${!localSchedulableContainers}`);
          if (list.nextToken !== null && list.nextToken !== undefined) {
            return compute(localSchedulableContainers + totalSchedulableContainers, list.nextToken);
          } else {
            return localSchedulableContainers + totalSchedulableContainers;
          }
        });
    });
}
exports.handler = (event, context, cb) => {
  console.log(`Invoke: ${!JSON.stringify(event)}`);
  compute(0, undefined)
    .then((schedulableContainers) => {
      console.log(`schedulableContainers: ${!schedulableContainers}`);
      return cloudwatch.putMetricData({
        MetricData: [{
          MetricName: 'SchedulableContainers',
          Dimensions: [{
            Name: 'ClusterName',
            Value: CLUSTER
          }],
          Value: schedulableContainers,
          Unit: 'Count'
        }],
        Namespace: NAMESPACE
      }).promise();
    })
    .then(() => cb())
    .catch(cb);
};
