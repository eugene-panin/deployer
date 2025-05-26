FROM alpine:3.21.3 AS builder

ARG TERRAFORM_VERSION
ARG TERRAGRUNT_VERSION
ARG TARGETARCH

RUN apk add --no-cache curl unzip aws-cli helm kubectl && \
    curl -L0 "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip" -o "terraform.zip" && \
    unzip -q terraform.zip -d /usr/local/bin && \
    rm terraform.zip && \
    curl -L0 "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_${TARGETARCH}" -o "terragrunt" && \
    mv terragrunt /usr/local/bin/terragrunt && \
    chmod +x /usr/local/bin/terragrunt

WORKDIR /workspace

# Set up non-root user
RUN addgroup -g 1025 nonroot && \
    adduser -D nonroot -u 1025 -G nonroot
USER nonroot

ENTRYPOINT ["/bin/sh"]

LABEL org.opencontainers.image.title="Deployment Tools"
LABEL org.opencontainers.image.description="Docker image with AWS CLI"
LABEL org.opencontainers.image.source="https://github.com/eugene-panin/deployer"