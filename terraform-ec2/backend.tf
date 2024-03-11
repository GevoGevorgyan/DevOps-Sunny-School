terraform {
  backend "s3" {
    bucket         = "ggs3forterraform"
    key            = "terraform/state"
    region         = "us-east-2"
    dynamodb_table = "ggdynamodbforterraform"
  }
}
