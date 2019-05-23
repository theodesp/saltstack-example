Packer + Saltstack
---

Example Packer builder for creating a Saltstack Master and Minion images on DigitalOcean

## How to Run

Validate the variables.json. For example you need a DigitalOcean API key

```bash
➜ packer validate -var-file variables-master.json ubuntu-do.json
Template validated successfully.
➜ packer validate -var-file variables-minion.json ubuntu-do.json
Template validated successfully.
```

Run the associated builders. After they finish navigate to the Snapshots area of your DigitalOcean panel to see them.

