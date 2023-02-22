
 terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
}
}
resource "random_integer" "test_random_int" {
  min    = 0
  max    = 100
}
