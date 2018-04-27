# eip for web1 resource in aws
resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.web1.id}"
  allocation_id = "${aws_eip.web_eip.id}"
}


# test web1 resource for aws
resource "aws_instance" "web1" {
    ami = "ami-6dfe5010"
    instance_type = "t2.micro"
    key_name = "Test1"
    security_groups = ["Web/Email"]
    associate_public_ip_address = true
    
    tags {
        Name = "web1"
    }
    
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("Test1.pem")}"
    }

    provisioner "remote-exec" {
        scripts = [
            "scripts/web.sh"
        ]
    }

    provisioner "local-exec" {
        command = "ANSIBLE_CONFIG=ansible/ansible.cfg ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key Test1.pem -i '${aws_instance.web1.public_ip},' ansible/playbooks/patch.yml"
    }

    provisioner "local-exec" {
        command = "ANSIBLE_CONFIG=ansible/ansible.cfg ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key Test1.pem -i '${aws_instance.web1.public_ip},' ansible/playbooks/provision.yml"
    }
}

resource "aws_eip" "web_eip" {
  instance = "${aws_instance.web1.id}"
  vpc = true
}
