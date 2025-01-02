output "security_group_id" {
  value = aws_security_group.lab2_sec_group.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}