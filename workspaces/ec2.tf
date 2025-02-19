resource "aws_security_group" "Allow-sshhh"{
    name = "Allow SShh-${terraform.workspace}"

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
    Name = "Terraform-demo-${terraform.workspace}"
  }
}
  resource "aws_instance" "terraform"{
    ami = "ami-09c813fb71547fc4f"
    instance_type = lookup (var.instance_type,terraform.workspace)
    vpc_security_group_ids = [aws_security_group.Allow-sshhh.id]
  
    tags = {
    Name = "terraform-${terraform.workspace}"
    } 

  
}


