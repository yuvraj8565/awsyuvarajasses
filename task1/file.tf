# INDEX FILE
resource "aws_s3_bucket_object" "object" {
  bucket   = aws_s3_bucket.s3_bucket.id
  key    = "index.html"
  source = "index.html"
  etag   = filemd5("index.html")

}
