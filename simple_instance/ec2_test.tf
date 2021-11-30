provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "47804a6279155807a1ca226ea569875a779ee7e6"
    git_file             = "simple_instance/ec2_test.tf"
    git_last_modified_at = "2021-11-30 00:28:00"
    git_last_modified_by = "94995421+kkline-panw@users.noreply.github.com"
    git_modifiers        = "94995421+kkline-panw"
    git_org              = "kkline-panw"
    git_repo             = "terragoat"
    yor_trace            = "346a2213-8936-4a49-84f9-ef9f7ccfe3b8"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "47804a6279155807a1ca226ea569875a779ee7e6"
    git_file             = "simple_instance/ec2_test.tf"
    git_last_modified_at = "2021-11-30 00:28:00"
    git_last_modified_by = "94995421+kkline-panw@users.noreply.github.com"
    git_modifiers        = "94995421+kkline-panw"
    git_org              = "kkline-panw"
    git_repo             = "terragoat"
    yor_trace            = "7f07cd0a-ec68-41ed-8dc6-e417dfc0a83c"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
