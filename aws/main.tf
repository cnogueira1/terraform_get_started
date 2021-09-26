#Configuração AWS PROVIDER
provider "aws" {
  region = "us-east-1"
}


#Criando AWS BUCKET
resource "aws_s3_bucket" "bucket_web_teste" {
  bucket = "projeto-subir-deploy"
  acl="private"

  tags = {
    Name = "projeto-subir-deploy"
    Enviroment = "Dev"
  }
}

#Aplicando AWS BUCKET como site estatico
# resource "aws_s3_bucket" "bucket_web_teste" {
#   bucket = "projeto-subir-deploy.hashicorp.com"
#   acl    = "public-read"
#   policy = file("policy.json")

#   website {
#     index_document = "index.html"
#     error_document = "error.html"

#     routing_rules = <<EOF
#     [{
#         "Condition": {
#             "KeyPrefixEquals": "docs/"
#         },
#         "Redirect": {
#             "ReplaceKeyPrefixWith": "documents/"
#         }
#     }]
#     EOF
#   }
# }