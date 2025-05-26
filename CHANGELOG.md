# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Initial Dockerfile with support for AWS CLI, Terraform, Terragrunt, Helm, and Kubectl.
- Multi-architecture support for `amd64` and `arm64`.
- GitHub Actions workflow for automated builds and pushes to GitHub Container Registry.
- Makefile for simplified build, run, and clean commands.
- Support for specifying `TARGETARCH` during builds.
- Appending architecture to Docker image tags (e.g., `deployer:amd64`).

### Changed

- Updated README to reflect the new features and usage instructions.
- Simplified `Makefile` by removing the `PLATFORM` variable and deriving `TARGETARCH` dynamically.

## [1.0.0] - 2025-05-26

### Added

- First release of the Deployer Docker image.
