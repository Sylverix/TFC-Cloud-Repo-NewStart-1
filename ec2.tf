terraform {
  cloud {
    organization = "MB-Org"

    workspaces {
      name = "TFC-Cloud-Repo-NewStart-1"
    }
  }
}

data "aws_ami" "latest-linux-ec2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "terraform-web-server" {
  ami = data.aws_ami.latest-linux-ec2.id
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Web Server"
  }
}
