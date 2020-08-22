resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group" "management" {
  name = "management"
  path = "/"
}