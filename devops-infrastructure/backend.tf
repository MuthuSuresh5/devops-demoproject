terraform {
  backend "s3" {
    bucket       = "terraform-demo-s3-5"
    key          = "devops-infrastructure/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}