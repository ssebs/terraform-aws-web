# terraform-aws-web

Terraform config files to spin up an EC2 instance and provision it using shell scripts and ansible.

### Notes:
- Makefile is used to simplify the commands
- You should have already configured API access with AWS, along with an ssh key pair
- You need to add a \*.tfvars file (Mine is named ssebs-aws.tfvars) to use the makefile, and create/connectto your instance.
    - this file should contain two vars:
        - *aws_access_key*
        - *aws_secret_key*
- You need your private key for aws in the repo (Mine is called Test1.pem)
- Ansible should be installed on your local system

### Usage:
- Setup AWS IAM Roles, API access, ssh key pair
- Copy private key to this dir
- Create a *\<name\>.tfvars* file with your API access info
- Modify & Verify all of the *\*.tf* files
- Run the make file
