data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "test-tf-deva"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}