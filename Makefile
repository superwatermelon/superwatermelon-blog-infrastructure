.PHONY: default
default: init plan

.PHONY: init
init:
	terraform init -backend-config=backend.hcl

.PHONY: plan
plan:
	terraform plan -out=terraform.tfplan

.PHONY: apply
apply:
	terraform apply terraform.tfplan
