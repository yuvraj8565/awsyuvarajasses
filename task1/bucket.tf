# create s3 bucket

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "yuvraj-assessment"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}


resource "aws_s3_bucket_policy" "s3-read-policy" {
  bucket   = aws_s3_bucket.s3_bucket.id
  policy = file("policy.json")
}

/*
resource "aws_iam_role_policy" "s3-read-policy" {
  name   = "s3-read"
  role   = awss3read
  policy = data.aws_iam_policy_document.s3_read_permissions.json
}

data "aws_iam_policy_document" "s3_read_permissions" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:ListBucket",
    ]

    resources = ["arn:aws:s3:::yuvraj-assessment",
                  "arn:aws:s3:::yuvraj-assessment/*",
    ]
 }
}
*/
# create db for state file locks

resource "aws_dynamodb_table" "terraform_locks2" {
  name         = "assesment-locks5"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
