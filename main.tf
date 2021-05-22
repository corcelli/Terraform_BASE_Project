

resource "aws_instance" "instance01" {

  ami           = var.id_instance_ami
  instance_type = var.type_instance_ami
  key_name      = "Keys_DockerServerFastDeliveryAWS"
  lifecycle {
    ignore_changes = [
      user_data
    ]
  }

  user_data = <<-EOF
        #!/bin/bash
        apt-get install git -y
        git clone https://github.com/corcelli/devops.git
        cd devops
        chmod +x install_docker_debian_v1.sh
        ./install_docker_debian_v1.sh
        EOF

  root_block_device {
    volume_size = "110"
  }

  tags = local.tags_projeto

  # tags = {
  #   nome    = "LinuxAWS"
  #   projeto = "Trinity"
  # }
}


# resource "aws_s3_bucket" "bucketrandom" {

#   bucket = "${random_pet.pet.id}"

# }