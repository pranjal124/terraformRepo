terraform{
 required_providers{
  aws = {
   source = "hashicorp/aws"
  }
 }
}
provider "aws"{
 access_key = "AKIA6DGDC6XBIVIMGWP3"
 secret_key = "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"
 region = "us-west-2"
}
resource "aws_instance" "web" {
  ami = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "DevOps Aviva Assignment" > /var/www/html/index.html
              EOF
}
output "public_ip" {
   value = aws_instance.web.public_ip 
}
