resource "aws_flow_log" "flow-log-test" {
  log_destination      = aws_s3_bucket.my-log-test.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id      = var.vpc_id
}
resource "aws_s3_bucket" "my-log-test" {
  bucket = "my-log-test"
}