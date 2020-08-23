
resource "aws_key_pair" "task" {
  key_name   = "task-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}