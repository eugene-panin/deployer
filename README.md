# Deployer Docker Image

This repository contains a Dockerfile to create a Docker image that includes AWS CLI v2 and Terraform. The image is built using a multi-stage build to keep the final image size small.

## Description

The Deployer Docker image is based on Ubuntu and includes:

- AWS CLI v2 (version 2.17.23)
- Terraform (version 1.5.3)

This image is designed for use in CI/CD pipelines, allowing for easy deployment and infrastructure management.

## How to Build the Image

To build the Docker image, run the following command in the directory containing the Dockerfile:

```sh
docker build -t deployer:latest .
```

## How to Use the Image

You can use this image in your CI/CD pipeline or run it locally to execute Terraform and AWS CLI commands. Here's an example of how to run the image:

```sh
docker run --rm -it deployer:latest /bin/bash
```

This will start a container with an interactive bash shell where you can run `terraform` and `aws` commands.

## Dockerfile Details

The Dockerfile is a multi-stage build with the following stages:

1. **Builder Stage:**
   - Based on `ubuntu:latest`.
   - Updates and upgrades the system packages.
   - Installs `curl` and `unzip`.
   - Downloads and installs AWS CLI v2.
   - Downloads and unzips Terraform.

2. **Runtime Stage:**
   - Based on `ubuntu:latest`.
   - Copies Terraform binary and AWS CLI installation from the builder stage.
   - Creates symbolic links for `aws` and `aws_completer` commands.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
