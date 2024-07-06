terraform{
 required_providers{
  aws = {
   source = "hashicorp/aws"
  }
 }
}
provider "aws"{
 access_key = "AKIA5FTZEDZLZGMDFOXJ"
 secret_key = "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"
 region = "us-west-1"
}
resource "aws_key_pair" "tf_key" {
  key_name   = "tf-key"
  public_key = file("${path.module}/rsa.pub")
}
resource "aws_instance" "web" {
  ami = "ami-08012c0a9ee8e21c4"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.tf_key.key_name}"
  user_data = file("${path.module}/script.sh")
}
output "public_ip" {
   value = aws_instance.web.public_ip 
}

