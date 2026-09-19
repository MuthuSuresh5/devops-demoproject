terraform {
  backend "s3" {
    bucket       = "YOUR-TERRAFORM-STATE-BUCKET"
    key          = "devops-infrastructure/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}