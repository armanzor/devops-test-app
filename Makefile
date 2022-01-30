
BRANCH ?= master

build-app:
	docker build app --tag armanzor/csssr:$(BRANCH)
	docker push armanzor/csssr:$(BRANCH)

HELM ?= helm

deploy:
	$(HELM) upgrade --install my-app-$(BRANCH) chart --set image.tag=$(BRANCH) --set ingress.host=$(BRANCH).my-app.com --namespace=csssr
