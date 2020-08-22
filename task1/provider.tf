provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "Tim" {
  name = "Tim"
}

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}