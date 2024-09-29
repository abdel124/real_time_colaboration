output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}
