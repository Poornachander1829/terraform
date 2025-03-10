resource "aws_security_group" "Allow-sshhh"{
    name = "Allow SShh"

description = "Allow all trafic from port 22"

 ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

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
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.Allow-sshhh.id]
  
    tags = {
    Name = "terraform"
    } 

    provisioner "local-exec" {
      command = "echo ${self.private_ip} > inventory "
    }

    connection{
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip 
    }

    provisioner "remote-exec" {
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx",
      ]
    }
    provisioner "remote-exec" {
      when = destroy
      inline = [
        
        "sudo systemctl stop nginx",
      ]
    }



  
}


