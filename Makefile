plan:
	terraform plan -var-file ssebs-aws.tfvars
apply:
	terraform apply -var-file ssebs-aws.tfvars
destroy:
	terraform destroy -var-file ssebs-aws.tfvars
rebuild:
	@$(MAKE) destroy
	@$(MAKE) apply
