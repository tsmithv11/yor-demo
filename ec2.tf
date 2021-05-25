terraform {
  required_version = ">=0.14"
}

provider "aws" {
  region = "us-east-1"
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name                 = "Allow ssh Traffic"
    git_commit           = "574a6c6fe6a9ad14ffe966bae91a260f2fa0e76c"
    git_file             = "ec2.tf"
    git_last_modified_at = "2021-05-23 19:44:19"
    git_last_modified_by = "28880387+tsmithv11@users.noreply.github.com"
    git_modifiers        = "28880387+tsmithv11"
    git_org              = "tsmithv11"
    git_repo             = "yor-demo"
    yor_trace            = "cd932137-f0e9-4e9f-8839-d5ecd60dd0d7"
    Schedule             = "office-hours"
  }
}

resource "aws_instance" "web_server_instance" {
  count           = 1
  ami             = "ami-03d315ad33b9d49c4"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    git_commit           = "b688c3af1c42b8a433e02f09bb30bd99b9a1ac5b"
    git_file             = "ec2.tf"
    git_last_modified_at = "2021-05-25 00:57:08"
    git_last_modified_by = "28880387+tsmithv11@users.noreply.github.com"
    git_modifiers        = "28880387+tsmithv11/41898282+github-actions[bot]"
    git_org              = "tsmithv11"
    git_repo             = "yor-demo"
    yor_trace            = "34ca75b3-9be8-446a-9c73-6c8edeb2d2e3"
    Schedule             = "office-hours"
  }
}