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

resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"
  users = [
    "${aws_iam_user.Tim.name}"
  ]
  group = "${aws_iam_group.developers.name}"
}