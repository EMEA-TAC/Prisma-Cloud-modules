# Prisma-Cloud-modules

## Self-Hosted Console

The purpose of these modules is to easily be able to deploy Prisma Cloud Compute console.

### GCP Instance

This module provisions the necessary firewall rules and GCE instance within GCP.

Basic terraform structure to use the module:

```
module "onebox" {
  source = "github.com/EMEA-TAC/prisma-cloud-modules/GCP-onebox-module"
  name = 
  pcc-tar = 
  pcc-version = 
}
```
The variables **name**, **pcc-tar** and **pcc-version** are required for the module.

- **name**: Name for the instance and firewall rule, usually should be version and username. Module already preceeds the value with *pcce-* for the instance name. 
- **pcc-tar**: Tar file generated after downloading the twistlock release. Example: `"prisma_cloud_compute_edition_32_02_127.tar.gz"`
- **pcc-version**: URL for the version to install. Example: `"https://cdn.twistlock.com/releases/TdNcyMXp/prisma_cloud_compute_edition_32_02_127.tar.gz"`

Additional optional variables are:

- **zone**: Specify the zone in which the instance will be deployed. Type *string*. Default value `europe-southwest1-a`
- **network**: Specify the VPC in which the instance will be deployed. Type *string*. Default value `default`
- **script**: Use a custom script instead of the one provided within the module to deploy PCC within the instance.
