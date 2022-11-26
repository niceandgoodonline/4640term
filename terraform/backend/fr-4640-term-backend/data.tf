data "aws_iam_policy_document" "fr_4640_term_backend_kms_policy" {
  statement {
    effect    = "Allow"
    resources = ["*"]
    actions   = ["kms:*"]

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::666630334140:role/Terraform-Deployment",
        "arn:aws:iam::666630334140:user/felix"
      ]
    }
  }
}
