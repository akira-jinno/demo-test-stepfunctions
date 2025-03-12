# ExtractData Lambda関数の作成（データ抽出処理）
resource "aws_lambda_function" "extract_data" {
  function_name = "ExtractData"  # Lambda関数の名前
  filename      = "lambda/extract_data.zip"  # デプロイ用のZIPファイル
  handler       = "extract_data.lambda_handler"  # ハンドラー（関数のエントリーポイント）
  runtime       = "python3.8"  # Pythonのバージョン
  role          = aws_iam_role.lambda_role.arn  # IAMロールを指定
}

# ProcessData Lambda関数の作成（データ加工処理）
resource "aws_lambda_function" "process_data" {
  function_name = "ProcessData"
  filename      = "lambda/process_data.zip"
  handler       = "process_data.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_role.arn
}

# UploadToS3 Lambda関数の作成（データをS3にアップロード）
resource "aws_lambda_function" "upload_to_s3" {
  function_name = "UploadToS3"
  filename      = "lambda/upload_to_s3.zip"
  handler       = "upload_to_s3.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_role.arn
}


resource "aws_lambda_function" "send_notification" {
  function_name = "SendNotification"
  filename      = "lambda/send_notification.zip"
  handler       = "send_notification.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_role.arn
}
