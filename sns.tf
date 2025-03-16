resource "aws_sns_topic" "job_notification" {
  name = "JobNotificationTopic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.job_notification.arn
  protocol  = "email"
  endpoint  = "xxxx@xxxx.com"
}
