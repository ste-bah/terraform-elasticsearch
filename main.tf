provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region = "${var.region}"
  distribution = "wily"
  architecture = "amd64"
  virttype = "hvm"
  storagetype = "ebs"
}

output "dns_name" {
  value = "${aws_elb.es.dns_name}"
}

output "security_group_id" {
  value = "${aws_security_group.elb.id}"
}

output "ip" {
  value = "${join(",", aws_instance.es.*.private_ip)}"
}
