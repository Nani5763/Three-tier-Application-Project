provider "aws" {
    region = "us-east-2"
}
provider "aws" {
  alias  = "secondary"  
  region = "us-east-1"
}
