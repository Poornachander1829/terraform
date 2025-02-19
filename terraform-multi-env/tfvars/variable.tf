variable "insatnces"{
    default= ["mysql", "backend", "frontend"]



}
variable "project-name" {
  type        = string
  default     = "expense"
}

variable "environment" {

}

