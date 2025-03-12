resource "aws_sfn_state_machine" "job_workflow" {
  name     = "HINEMOSMigrationWorkflow"
  role_arn = aws_iam_role.step_functions_role.arn

  definition = jsonencode({
    Comment = "HINEMOSのジョブをAWS Step Functionsに移行",
    StartAt = "ExtractData",
    States = {
      ExtractData = {
        Type     = "Task",
        Resource = aws_lambda_function.extract_data.arn,
        Next     = "ProcessData"
      },
      ProcessData = {
        Type     = "Task",
        Resource = aws_lambda_function.process_data.arn,
        Next     = "UploadToS3"
      },
      UploadToS3 = {
        Type     = "Task",
        Resource = aws_lambda_function.upload_to_s3.arn,
        Next     = "SendNotification"
      },
      SendNotification = {
        Type     = "Task",
        Resource = aws_lambda_function.send_notification.arn,
        End      = true
      }
    }
  })
}
