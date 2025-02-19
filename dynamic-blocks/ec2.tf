resource "aws_security_group" "Allow-sshhh"{
    name = "Allow SShh"

description = "Allow all trafic from port 22"

 dynamic "ingress" {#terraform will give you kyeword with block name. you can iterate using ingress.
  for_each = var.ingress-ports
  content{ 
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] #allowing now from every one
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Terraform-demo"
  }
}
  resource "aws_instance" "terraform"{
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.Allow-sshhh.id]
  
    tags = {
    Name = "terraform"
    } 

  
}


