resource "aws_security_group" "Allow-sshhh"{
    name = "Allow SShh"

description = "Allow all trafic from port 22"

 ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] #allowing now from every one
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = local.name
  }
}
  resource "aws_instance" "terraform"{
    ami = local.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.Allow-sshhh.id]
  
    tags = {
    Name = local.name
    } 

  
}


