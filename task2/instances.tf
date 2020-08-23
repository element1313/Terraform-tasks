resource "aws_instance" "web" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
}

resource "aws_key_pair" "task" {
  key_name   = "task-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}