variable "project" {
    default = "roboshop"
  
}


variable "commn_tags" {
    default = {
        project = "roboshop"
        terraform ="true"
    }
  
}

variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_description" {
    default = "allowing all ports and allow IPs"
  
}

variable "instances" {
    default = ["mongodb","redis"]
}


variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
  
}

variable "instance_type" {
    default = {
        dev = "t3.micro"
        prod = "t3.small"
    }
}
