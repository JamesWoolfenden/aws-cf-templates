'use strict';
const AWS = require('aws-sdk');
const autoscaling = new AWS.AutoScaling({apiVersion: '2011-01-01'});
const sp = process.env.SCALING_POLICY_NAME;
exports.handler = async function(event, context) {
  console.log(`Invoke: ${!JSON.stringify(event)}`);
  const res = await autoscaling.executePolicy({PolicyName: sp, HonorCooldown: false, MetricValue: -1.0, BreachThreshold: -1.0}).promise();
  console.log('Executed scaling policy', res);
}
