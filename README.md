06-resources/networking.tf

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

08-input-vars-locals-outputs/variables.tf 

```
variable "ec2_instance_type" {
    type = string
    # default = "t2.micro"
    description = "The type of managed EC2 instances."

    validation {
      condition = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
      error_message = "Only supports t2.micro and t3.micro"
    }

}
```