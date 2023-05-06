
# resource "aws_security_group" "allow_SSH_Slave" {
#   name        = "allow_SSH_Slave"
#   description = "Allow SSH inbound traffic"
#   #   vpc_id      = aws_vpc.main.id


#   ingress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#     # description      = "SSH from VPC"
#     # from_port        = 22
#     # to_port          = 22
#     # protocol         = "tcp"
#     # cidr_blocks      = ["61.6.14.46/32"]
#     # # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }

# resource "aws_key_pair" "deployer3" {
#   key_name   = "deployer-key3"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDD8gTEP0wdqJnHkVDc7IMzFygpsibTemZylZvk4gcGiaa+YX8/VpUEyOrqYOg/8OrOAsdQCpPcc8J3AhUBSvgjeKc7sJZ0N8v+AOKnVQDni/y+9mWD6oGOszzH6DVfoHOy1HRZAbF6n+xFkk0DeisSJ3FsGVQK/J5rYgXVCBJii34mL0+DOBogxLva8tDcLgWLz+qxs8QcH4hgrHkdT8whBKfKcypICGS4U/WgXFW5M3pN4OynSzeqJ9gXn0Fbq50J/t6Cpnr6wqlzRzocAMXnlgrchYZWZJgTL3W8zrg1Fx7RBy3fAbEyWoyrkB9cFIPSkmiUZG9xUhirI4MbdgHVNlkp7xU0V6KfCRlTNE+xzWlbPSga7kjlqiizjDoR7xExKNLbNthB6nlNIEwX+FljtgrTqMV2w6k8H3xfrhdG0993EnMMwdPVmltEjJeZ+l3BETUcibKGFFc5iyR99W7NKhriH5d6OvbXev7JmbqsXrwn8rnu3auDGJs7YaIwzmk= varunmanikoutlo@ip-172-31-17-206"
# }

# resource "aws_instance" "linux" {
#   ami           = "ami-0c02fb55956c7d316"
#   instance_type = "t2.micro"
#   key_name      = aws_key_pair.deployer3.key_name
#   # count         = 1 
#   vpc_security_group_ids = ["${aws_security_group.allow_SSH_Slave.id}"]
#   tags = {
#     "Name" = "Linux-Node"
#     "ENV"  = "Dev"
#   }

#   depends_on = [aws_key_pair.deployer3]

# }

# ####### Ubuntu VM #####


# resource "aws_instance" "ubuntu" {
#   ami                    = "ami-04505e74c0741db8d"
#   instance_type          = "t2.micro"
#   key_name               = aws_key_pair.deployer3.key_name
#   vpc_security_group_ids = ["${aws_security_group.allow_SSH_Slave.id}"]
#   tags = {
#     "Name" = "UBUNTU-sl-1"
#     "ENV"  = "Dev"
#   }

#   # Type of connection to be established
#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("./deployer")
#     host        = self.public_ip
#   }
#   # Remotely execute commands to install Java, Python, Jenkins
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update && upgrade",
#       "sudo apt-get install -y python3.8 default-jdk mvn git",
#       "echo 62c3f6eefeab36fe989cd376360e04baa0de08c325b93de880693a6e2af67298 > secret-file",
#       "curl -sO http://54.160.148.48:8080/jnlpJars/agent.jar",
#       "java -jar agent.jar -jnlpUrl http://54.160.148.48:8080/manage/computer/ubuntu/jenkins-agent.jnlp -secret @secret-file -workDir '/home/ubuntu/'",
#     ]
#   }

#   depends_on = [aws_key_pair.deployer3]

# }

# output "ubuntu" {
#   value       = aws_instance.ubuntu.public_ip
#   description = "description"
# }
# output "linux" {
#   value       = aws_instance.linux.public_ip
#   description = "description"
# }
