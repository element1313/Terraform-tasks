resource "null_resource" "commands" {
  depends_on = ["aws_instance.web"]
  triggers = {
      always_run = "${timestamp()}"
  }

  # push file to remote server
  provisioner "file" {
    connection {
      host        = "${aws_instance.web.public_ip}"
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
      host        = "${aws_instance.web.public_ip}"
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
      "sudo yum install telnet -y",
    ]
  }
}
