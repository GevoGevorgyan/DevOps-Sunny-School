output "public_ip_instance_1" {
  value = aws_instance.web[0].public_ip
}
output "private_ip_instance_1" {
  value = aws_instance.web[0].private_ip
}

output "public_ip_instance_2" {
  value = aws_instance.web[1].public_ip
}
output "private_ip_instance_2" {
  value = aws_instance.web[1].private_ip
}

output "public_ip_instance_3" {
  value = aws_instance.web[2].public_ip
}
output "private_ip_instance_3" {
  value = aws_instance.web[2].private_ip
}