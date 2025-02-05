variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is the AMI id devops-practice whic is RHEL9"
}
variable "instance_type" {
  type        = string
  default     = "t3.micro"
  
}
variable "environment"{
  default = "dev"
}
variable "tags" {

  type        = map
  default     = {
    Name = "backend"
    Project = "expence"
    Environment = "dev"
    Terraform = "True"
    component = "backend"

  }
}

variable "sg-name"{
    default = "Allow-ssh"
}

variable "sg-description"{
    default = "this is for allowing all traffic"
}
variable "from-port" {
  type        = number
  default     = 22
 
}
variable "to-port" {
  type        = number
  default     = 22
 
}
variable "protocal" {
  type        = string
  default     = "tcp"
  
}
variable "ingress-cidr"{
    type = list(string)
    default = ["0.0.0.0/0"] 
}


