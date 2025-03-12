import json

def lambda_handler(event, context):
    # 前のLambda関数からデータを取得
    body = json.loads(event["body"])
    patients = body["patients"]
    
    # 仮のデータ加工（例: 名前を大文字にする）
    processed_patients = [{"id": p["id"], "name": p["name"].upper()} for p in patients]
    
    return {
        "statusCode": 200,
        "body": json.dumps({"processed_patients": processed_patients})
    }
