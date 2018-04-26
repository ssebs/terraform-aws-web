plan:
	terraform plan -var-file *.tfvars
apply:
	terraform apply -var-file *.tfvars
destroy:
	terraform destroy -var-file *.tfvars
rebuild:
	@$(MAKE) destroy
	@$(MAKE) apply
