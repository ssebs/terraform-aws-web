USER=ubuntu

plan:
	terraform plan -var-file *.tfvars
apply:
	terraform apply -var-file *.tfvars
destroy:
	terraform destroy -var-file *.tfvars
rebuild:
	@$(MAKE) destroy
	@$(MAKE) apply
ip:
	@terraform refresh -var-file *.tfvars
	@echo $$(terraform state show | egrep -e 'public_ip(.*)= [^true]' | cut -f 2 -d '=' | xargs) 
ssh:
	@echo Run this with the IP from 'make ip'
	@echo ssh -i *.pem $(USER)@
