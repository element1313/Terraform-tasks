resource "aws_route53_record" "www" {
  zone_id = "Z0531371HZCF3T6DKDYY"
  name    = "www.mywhiteswan.com"
  type    = "A"
  ttl     = "30"
  records = [
      "${aws_instance.web.public_ip}"
    #   "${aws_instance.web1.public_ip}"
    #   "${aws_instance.web2.public_ip}"
    #   "${aws_instance.web3.public_ip}"
      ]
}