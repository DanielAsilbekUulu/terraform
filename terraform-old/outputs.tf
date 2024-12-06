output "ami" {
  value = aws_instance.hisec2.ami #ami , it's must, i cant change   (aws_instance.myec2 is from main.tf)
}

output "instance_ip" {
  value = aws_instance.hisec2.public_ip #public_ip , it's must too     
}
