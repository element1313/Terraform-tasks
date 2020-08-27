resource "aws_instance" "web" {
  ami           = "ami-02354e95b39ca8dec"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.task.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.provisioner.id}"]

# push file to remote server
  provisioner "file" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
    source      = "r1soft.repo"
    destination = "/tmp/r1soft.repo"
  }

# Executes linux commands on remote machine
  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    inline = [
      "sudo yum install epel-release -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo cp /tmp/r1soft.repo /etc/yum.repos.d/r1soft.repo",
    ]
  }
}
