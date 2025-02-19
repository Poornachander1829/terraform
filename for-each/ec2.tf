resource "aws_security_group" "Allow-sshhh"{
    name = "Allow SShh-for each"

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
    Name = "Terraform-demo"
  }
}
  resource "aws_instance" "terraform"{
    for_each = var.instances #terraform will give us a variable called each
    ami = "ami-09c813fb71547fc4f"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.Allow-sshhh.id]
  
    tags = {
    Name = each.key
    } 

  
}

output "ec2_info"{
  value = aws_instance.terraform
}


