resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"

  users = [
    "${aws_iam_user.Tim.name}",
    "${aws_iam_user.Bob.name}",
    "${aws_iam_user.Ben.name}",
  ]

  group = "${aws_iam_group.developers.name}"
}




resource "aws_iam_group_membership" "management_team" {
  name = "management-group-membership"

  users = [
    "${aws_iam_user.Ben.name}",
  ]

  group = "${aws_iam_group.management.name}"
}
