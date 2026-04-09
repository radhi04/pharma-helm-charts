terraform {
  backend "s3" {
    bucket         = "pharma-tf-state-478879297284"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "pharma-tf-lock"
    encrypt        = true
  }
}
