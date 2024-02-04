variable "ami" {
   type        = string
   description = "Ubuntu AMI ID"
   default     = "ami-03f4878755434977f"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "Terraform"
}
