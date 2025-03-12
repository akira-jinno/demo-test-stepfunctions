import boto3
import json

sns = boto3.client("sns")

def lambda_handler(event, context):
    response = sns.publish(
        TopicArn="arn:aws:sns:ap-northeast-1:338200587558:JobNotificationTopic",
        Message=json.dumps({"default": "Step Functions Execution Completed"}),
        MessageStructure="json"
    )
    return {"statusCode": 200, "body": json.dumps(response)}
