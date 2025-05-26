# Deployer Docker Image

This repository contains a Dockerfile to create a lightweight Docker image that includes AWS CLI, Terraform, and Terragrunt. The image is built using a multi-stage build to optimize size and performance.

## Description

The Deployer Docker image is based on Alpine Linux and includes:

- AWS CLI (latest version)
- Terraform (configurable via `TERRAFORM_VERSION`)
- Terragrunt (configurable via `TERRAGRUNT_VERSION`)
- Helm
- Kubectl

This image is designed for use in CI/CD pipelines, allowing for easy deployment and infrastructure management.

## How to Build the Image

To build the Docker image locally, run the following command in the directory containing the Dockerfile:

```sh
docker build --build-arg TERRAFORM_VERSION=1.12.1 --build-arg TERRAGRUNT_VERSION=0.80.2 --build-arg TARGETARCH=$(uname -m) -t deployer:$(uname -m) .
```

You can also explicitly specify the architecture by setting the `TARGETARCH` variable:

```sh
docker build --build-arg TERRAFORM_VERSION=1.12.1 --build-arg TERRAGRUNT_VERSION=0.80.2 --build-arg TARGETARCH=arm64 -t deployer:arm64 .
```

## Multi-Architecture Support

This image supports multiple architectures, including `amd64` and `arm64`. The architecture can be specified using the `TARGETARCH` build argument. The resulting image tags will include the architecture (e.g., `deployer:amd64`).

## How to Use the Image

You can use this image in your CI/CD pipeline or run it locally to execute Terraform, AWS CLI, and other commands. Here's an example of how to run the image:

```sh
docker run --rm -it deployer:latest /bin/sh
```

This will start a container with an interactive shell where you can run `terraform`, `aws`, `terragrunt`, `helm`, and `kubectl` commands.

## GitHub Actions Workflow

A GitHub Actions workflow is included to automate the build and push process. The workflow:

- Builds the image for multiple architectures (`amd64` and `arm64`).
- Pushes the image to GitHub Container Registry (GHCR).
- Tags the image with `latest` and the branch or tag name.

To trigger the workflow, push changes to the `main` branch or create a Git tag matching the pattern `v*.*.*`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
