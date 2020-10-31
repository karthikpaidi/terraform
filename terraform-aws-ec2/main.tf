provider "aws" {
  access_key = var.aws_accesskey
  secret_key = var.aws_secretkey
  region     = var.aws_region
}

/*Ami id belongs to ubuntu 20 server 
if you want to deploy different AMI change the id*/
resource "aws_instance" "terraformec2example" {
  ami           = "ami-07efac79022b86107"
  instance_type = "t2.micro"
}