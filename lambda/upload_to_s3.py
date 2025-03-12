import json
import boto3

s3 = boto3.client("s3")
BUCKET_NAME = "processed-data-bucket"  # S3バケット名

def lambda_handler(event, context):
    body = json.loads(event["body"])
    data = json.dumps(body["processed_patients"])
    
    # S3へ保存
    s3.put_object(Bucket=BUCKET_NAME, Key="processed_data.json", Body=data)
    
    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Data uploaded to S3"})
    }
