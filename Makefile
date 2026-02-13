.PHONY: help create destroy recreate up down restart

help: ## Display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

#
# kind commands
#
create-cluster: destroy-cluster ## Create the k8s cluster with kind [alias: create|cc]
	@bash k8s/scripts/create-cluster.sh

destroy-cluster: ## Destroy the k8s cluster with kind [alias: destroy|dc]
	@bash k8s/scripts/destroy-cluster.sh

recreate-cluster: destroy create ## Recreate the k8s cluster with kind [alias: recreate|rc]

#
# tilt commands
#
down: ## Stop the cluster with tilt [alias: down|d]
	@tilt down

up: down ## Start the cluster with tilt [alias: up|u]
	@tilt up

restart: up ## Restart the cluster with tilt [alias: restart|r]


#
# alias
#
create: create-cluster
destroy: destroy-cluster
recreate: recreate-cluster

cc: create-cluster
dc: destroy-cluster
rc: recreate-cluster

u: up
d: down
r: restart