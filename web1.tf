# test web1 resource for aws
resource "aws_instance" "web1" {
    ami = "ami-6dfe5010"
    instance_type = "t2.micro"
    key_name = "Test1"
    security_groups = ["Web/Email"]
    
    tags {
        Name = "web1"
    }
    
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("Test1.pem")}"
    }

    provisioner "remote-exec" {
        inline = ["sleep 10;"]
    }
    provisioner "remote-exec" {
        scripts = [
            "scripts/web.sh"
        ]
    }

    provisioner "local-exec" {
        command = "sleep 20; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key Test1.pem -i '${aws_instance.web1.public_ip},' ansible/playbooks/patch.yml"
    }
}

