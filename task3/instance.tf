resource "aws_instance" "web" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  key_name = "aws_key_pair.key_name"
}
