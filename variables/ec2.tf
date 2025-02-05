resource "aws_security_group" "Allow-sshhh"{
    name = var.sg-name

description = var.sg-description 

 ingress {
    from_port        = var.from-port
    to_port          = var.to-port
    protocol         = var.protocal
    cidr_blocks      = var.ingress-cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] #allowing now from every one
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags

  }

  resource "aws_instance" "terraform"{
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.Allow-sshhh.id]
  
   tags = var.tags

  
}


