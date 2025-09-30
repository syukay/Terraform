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