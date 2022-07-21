provider "aws" {
  region     = "ap-south-1"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "tera-launch-inst-01"

  ami                    = "ami-08df646e18b182346"
  instance_type          = "t2.micro"
  key_name               = "docker-key"
  vpc_security_group_ids = ["sg-0e23b49a61c1307de"]
  subnet_id              = "subnet-0b8f656828d1c2793"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  
# lifecycle {
#   prevent_destroy = true
# }

}
