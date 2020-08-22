resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"

  users = [
    "${aws_iam_user.Tim.name}",
  ]

  group = "${aws_iam_group.developers.name}"
}
