import json

def lambda_handler(event, context):
    # 仮のデータ抽出処理
    data = {
        "patients": [
            {"id": 1, "name": "Alice"},
            {"id": 2, "name": "Bob"}
        ]
    }
    
    return {
        "statusCode": 200,
        "body": json.dumps(data)
    }
