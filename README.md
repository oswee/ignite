# Ignition

This repository contains automation code to Ignite (bootstrap) the baseline
for the whole infrastructure.
In order to provision and update the infrastructure in "GitOps" automated
fashion I need to have several core pieces lied down upfront:

- Vault
  Should hold all core variables, secrets if any, CA's, etc.
- MinIO
  Should host the storage for Vault Raft backups and Terraform state.
- Jenkins
  Jenkins instance will be used to spin up the rest of the infrastructure for
  Prime project development.

Execution of this repository code is manual.

## Dependencies

This repository is just one member of the whole "Prime Suite".
The other members are:

- DevEnv - My personal developer envirionment and tools
- Ignite - this repo
- Infra - Prime cluster/s where the Prime apps will be deployed.
- Prime - The Source Code of the Prime

"The Prime" is just an temporary "nickname" of the whole project.

## Installation

Install the requirements.
```bash
ansible-galaxy install -r roles/requirements.yml -f
```

## Usage

Run the playbook
```bash
ansible-playbook playbooks/playbook.yml
```
