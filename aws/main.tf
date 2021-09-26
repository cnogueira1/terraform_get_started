#Configuração AWS PROVIDER
provider "aws" {
  region = "us-east-1"
}

#Aplicando AWS BUCKET como site estatico
resource "aws_s3_bucket" "bucket_web_teste" {
  bucket = "projeto-subir-deploy.hashicorp.com"
  acl    = "private"
  # policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
    [{
        "Condition": {
            "KeyPrefixEquals": "docs/"
        },
        "Redirect": {
            "ReplaceKeyPrefixWith": "documents/"
        }
    }]
    EOF
  }

}

# #Politica de privacidade do bucket
# resource "aws_s3_bucket_public_access_block" "bucket_web_teste_policy" {
#   bucket = aws_s3_bucket.bucket_web_teste.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

#Subindo um arquivo de teste
resource "aws_s3_bucket_object" "bucket_web_teste_object" {
  bucket = "projeto-subir-deploy.hashicorp.com"
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type="html"
  content_language="pt-BR"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("index.html")
}