### 06-resources/networking.tf

```
locals {
  common_tags = {
    ManagedBy  = "Terraform"
    Project    = "06-resources"
    CostCenter = "1234"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "06-resources"
  })
}
```

### 08-input-vars-locals-outputs/variables.tf 

```
variable "ec2_instance_type" {
  type        = string
  description = "The type of managed EC2 instances."

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micro and t3.micro"
  }

}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  description = "The size and type of the root block volume for EC2 instances."

  default = {
    size = 10
    type = gp2
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}
```

#### variable Precedence Order

TF_VAR instance_type = "t3.micro"
terraform.tfvars     = "t3.small"
prod.auto.tfvars     = "t3.large"
-var and -var-file cli arguments, latest with highest precedence = "t3.xlarge"
