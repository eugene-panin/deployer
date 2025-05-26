# Makefile for Deployer Docker Image

# Default values for build arguments
TERRAFORM_VERSION ?= 1.12.1
TERRAGRUNT_VERSION ?= 0.80.2
IMAGE_NAME ?= deployer:latest
TARGETARCH ?= $(shell uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')

.PHONY: build
build:
	@echo "Building Docker image for architecture $(TARGETARCH)"
	docker build \
		--no-cache \
		--platform linux/$(TARGETARCH) \
		--build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
		--build-arg TERRAGRUNT_VERSION=$(TERRAGRUNT_VERSION) \
		--build-arg TARGETARCH=$(TARGETARCH) \
		-t $(IMAGE_NAME)-$(TARGETARCH) .

.PHONY: run
run:
	@echo "Running Docker container from image $(IMAGE_NAME)"
	docker run --rm -it $(IMAGE_NAME) /bin/sh

.PHONY: clean
clean:
	@echo "Cleaning up dangling Docker images"
	docker image prune -f

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build   - Build the Docker image (default: latest versions and amd64)"
	@echo "  run     - Run a container from the built image"
	@echo "  clean   - Remove dangling Docker images"
	@echo "  help    - Show this help message"