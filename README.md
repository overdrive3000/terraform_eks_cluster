# AWS EKS Cluster Terraform Module

Terraform module to create an AWS EKS Cluster.

The EKS cluster requires:

* An existing VPC, with at least public subnets and internet gateway.
* The user/role used to when using this module should have permission enough to perform tasks using the Amazon EKS API (https://docs.aws.amazon.com/eks/latest/userguide/IAM_policies.html)

> Note: Take into account that the user used when using this module will be added to the kubernetes RBAC table as admin user. So, you will need this user in order to perform the initial EKS Kubernetes cluster configuration via kubectl.

## Features

This terraform module creates the following resources:

* IAM EKS Service Role (used by the cluster to itself)
* IAM Role for EKS Nodes
* IAM Instance Profile for EKS Nodes (This should be used by the EKS nodes that will joined to the cluster)
* Control Place Security Group (Security Group for Nodes to Cluster communication)
* EKS Cluster

## Usage

To use the module, include something like the following in your terraform configuration:

```
module "eks_cluster" {
  source = "github.com/overdrive3000/terraform_eks_cluster"

  cluster_name = "mycluster"
  vpc_id       = "vpc-00000000000"
  region       = "us-east-1"

  subnets = ["subnet-00000", "subnet-11111"]
}
```

## Inputs

| Name         | Description                          | Default   | Required   |
|--------------|--------------------------------------|:---------:|:----------:|
| cluster_name | EKS Cluster name                     | -         | yes        |
| vpc_id       | VPC Id in which Nodes will be placed | -         | yes        |
| subnets      | List of Subnet Ids for Nodes         | -         | yes        |


## Output

| Name                       | Description                      |
|----------------------------|----------------------------------|
| service_role               | EKS IAM Service Role             |
| node_instance_profile      | IAM Instance Profile of EKS Node |
| node_role_arn              | Role ARN of EKS Node             |
| security_group             | EKS Control Plane Security Group |
| endpoint                   | EKS Endpoint                     |
| certificate-authority-data |EKS Certificate Authority Data    |