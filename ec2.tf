resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from Terraform Web Server</h1>" > /var/www/html/index.html
EOF

  tags = {
    Name = "web-server"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

variable "subnet_id" {}
variable "ami_id" {}
variable "instance_type" {}
