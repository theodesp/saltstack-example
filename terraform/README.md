Terraform + Saltstack
---

Example Terraform module for deploying 1 Saltstack Master and N minions on Scaleway

## How to Run

Create a new workspace:

```bash
$ terraform new workspace salt
```

Pull down the providers and initialize:
```bash
$ terraform init
```

Set the following environmental variables to allow Terraform to interact with the Scaleway APIs:

```bash
$ export SCALEWAY_ACCESS_KEY=<your-access-key> 
$ export SCALEWAY_ORGANIZATION=<your-organization-key>
```

Deploy

```bash
$ terraform apply
```

Once deployed ssh into the master and accept the minion keys by name. No pre-seeding is done for security reasons.

```bash
$ ssh root@<master_ip>
$ salt-key -a salt-minion-1
$ salt-key -a salt-minion-2
```

Once the minions are accepted you can issue commands

When you want to destroy the environment:

```bash
$ terraform destroy -force
```