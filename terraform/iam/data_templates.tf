### DB policy
data "aws_iam_policy_document" "db_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "db_policy_doc" {
  statement {
    sid = "accessBackendS3"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::fr-4640-code-repo",
      "arn:aws:s3:::fr-4640-code-repo/*",
    ]
  }

  statement {
    sid = "dbPushSSM"

    actions = [
      "ssm:PutParameter",
      "ssm:DescribeParameters"
    ]

    resources = [
      "arn:aws:ssm:::parameter/fr-4640-term/secret/db/root",
      "arn:aws:ssm:::parameter/fr-4640-term/state/*"
    ]
  }

  statement {
    sid = "dbPullSSM"

    actions = [
      "ssm:GetParameter",
      "ssm:DescribeParameters"
    ]

    resources = [
      "arn:aws:ssm:::parameter/fr-4640-term/state/*"
    ]
  }
}

### App policy
data "aws_iam_policy_document" "app_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}


data "aws_iam_policy_document" "app_policy_doc" {
  statement {
    sid = "accessBackendS3"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::fr-4640-code-repo",
      "arn:aws:s3:::fr-4640-code-repo/*",
    ]
  }

  statement {
    sid = "frontendPullSSM"

    actions = [
      "ssm:GetParameter",
      "ssm:DescribeParameters"
    ]

    resources = [
      "arn:aws:ssm:::parameter/fr-4640-term/state/*"
    ]
  }

  statement {
    sid = "appPushSSM"

    actions = [
      "ssm:PutParameter",
      "ssm:DescribeParameters"
    ]

    resources = [
      "arn:aws:ssm:::parameter/fr-4640-term/state/ec2/app/frontend/*"
    ]
  }
}
