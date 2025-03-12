resource "aws_cloudwatch_event_rule" "daily_trigger" {
  name                = "DailyTrigger"
  schedule_expression = "cron(0 0 * * ? *)"
}

resource "aws_cloudwatch_event_target" "stepfunctions_target" {
  rule      = aws_cloudwatch_event_rule.daily_trigger.name
  arn       = aws_sfn_state_machine.job_workflow.arn
  role_arn  = aws_iam_role.step_functions_role.arn
}
