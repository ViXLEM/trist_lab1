terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "eu-north-1"
}

resource "aws_security_group" "lab2_sec_group" {
  name        = "lab2_sec_group"
  description = "Security Group for SSH and HTTP"
  vpc_id      = "vpc-0f419e704076874e7"

  # Inbound rule for SSH
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule for HTTP
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule (allow all)
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "ec2_instance" {
  tags                   = { Name = "lab2" }
  ami                    = "ami-075449515af5df0d1"
  instance_type          = "t3.micro"
  # count                  = "1"
  vpc_security_group_ids = [aws_security_group.lab2_sec_group.id]
  key_name               = "aws_private" # key pair for SSH access
  user_data              = file("ec2-user-data.sh")
}
