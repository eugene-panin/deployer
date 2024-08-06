FROM ubuntu:latest AS builder

RUN apt update
RUN apt -y upgrade
RUN apt -y install curl unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.17.23.zip" -o "awscliv2.zip"
RUN curl "https://releases.hashicorp.com/terraform/1.5.3/terraform_1.9.3_linux_amd64.zip" -o "terraform.zip"
RUN unzip -u awscliv2.zip
RUN unzip -u terraform.zip
RUN ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

FROM ubuntu:latest AS runtime
COPY --from=builder /terraform /usr/local/bin/terraform
COPY --from=builder /usr/local/aws-cli /usr/local/aws-cli
RUN ln -sf /usr/local/aws-cli/v2/current/bin/aws /usr/local/bin/aws
RUN ln -sf /usr/local/aws-cli/v2/current/bin/aws_completer /usr/local/bin/aws_completer
