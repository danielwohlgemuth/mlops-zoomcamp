# MLfLow on AWS

```mermaid
flowchart LR
    ec2(EC2)
    s3(S3)
    rds("RDS \(PostgreSQL\)")

    ec2 --> s3
    ec2 --> rds

    subgraph server_sg [Server Security Group]
        ec2
    end

    subgraph database_sg [Database Security Group]
        rds
    end

    subgraph vpc [MLflow VPC]
        server_sg
        database_sg
    end
```

## Prerequisites

- Tofu
- AWS Account

## Setup

### Set Up AWS CLI Authentication

1. In the AWS Console, click in the top right corner and click on Security credentials.
2. Scroll down to the "Access keys" section and click "Create access key".
3. Select the "Command Line Interface (CLI)" use case.
4. Give it a name and click "Create access key".
5. In the terminal, run `aws configure --profile mlops`
6. Copy the Access key and Secret access key from the AWS Console into the terminal.

### Initialize Terraform

Create a `prod.tfvars` file in the [environemnts](/02-experiment-tracking/running-mlflow-examples/scenario-3-iac/environment) folder.
Use the [prod.tfvars.example](/02-experiment-tracking/running-mlflow-examples/scenario-3-iac/environment/prod.tfvars.example) file as a starting point.
Then initialize terraform with `tofu init -var-file environment/prod.tfvars`

### Create a Key Pair

1. Go to EC2 -> Key Pairs.
2. Click "Create key pair".
3. Give it a name. Also set this name in the tfvars file in the environment folder.
4. Click "Create key pair" again.
5. Download the key pair file.

Change file permission

### Review Changes

```bash
tofu plan -var-file environment/prod.tfvars
```

### Apply Changes

```bash
tofu apply -var-file environment/prod.tfvars
```

### Cleanup

```bash
tofu destroy -var-file environment/prod.tfvars
```
