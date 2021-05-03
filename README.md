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

Install the requirements from the `cd ansible` directory:
```bash
ansible-galaxy collection install -r collections.yml -f
```

## Usage

Run the playbook
```bash
ansible-playbook playbooks/playbook-name.yml
```

Run the Molecule
```bash
molecule test
```
or to test only specific environment:

```bash
molecule converge -- --limit PXE
```
If testing whole environment it can take significant time, but it will definitely
be faster than doing that manualy. :)

Destroy specific environment:
```bash
molecule destroy -- --limit PXE
```

Sure you can run
```bash
molecule converge
```
as well. It will do the full "provisioning" for testing purposes.

To provision the infrastructure use
```bash
terraform -chdir=environments/development/000base apply
```
or
```bash
terraform -chdir=environments/development/000base destroy
```
to destroy the particular environment.

Be sure to follow the order of the environment prefixes. 000 prefix should be
provisioned first and only then 010 prefix can be provisioned. To decommision the
environment use same logic but in reverse order. Destroy 010 first and then 000.
