provider "aws" {
  region = "us-west-1"
}
resource "aws_iam_user" "demo" {
    name = "user.${count.index}"
    count = 3
}

output "usernumber" {
  value = aws_iam_user.demo[*].name
}

output "userdetails" {
  value = aws_iam_user.demo[*].arn
}

output "combined" {
  value = zipmap(aws_iam_user.demo[*].name,aws_iam_user.demo[*].arn)
}