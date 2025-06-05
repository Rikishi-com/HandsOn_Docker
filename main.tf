provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "web" {
  ami                    = "ami-026c39f4021df9abe" # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  instance_type          = "t2.micro"
  key_name               = "practice"
  vpc_security_group_ids = [aws_security_group.practice_sg.id]

  user_data = file("user_data.sh")

  tags = {
    Name = "Handson's Practice Instance"
  }
}

resource "aws_security_group" "practice_sg" {
  name        = "practice-sg"
  description = "Security group for practice"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

