### db iam role
resource "aws_iam_role" "db_role"{
  name               = "db_role"
  assume_role_policy = data.aws_iam_policy_document.db_s3_role_policy.json
}

resource "aws_iam_role_policy" "db_iam_policy"{
  name               = "db_iam_policy"
  role               = aws_iam_role.db_role.id
  policy             = data.aws_iam_policy_document.db_policy_doc.json
}

resource "aws_iam_instance_profile" "db_profile" {
  name               = "db_profile"
  role               = aws_iam_role.db_role.name
}

resource "aws_iam_role_policy_attachment" "db_attach_ssm_managed_core" {
  role               = aws_iam_role.db_role.id
  policy_arn         = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

### app iam role
resource "aws_iam_role" "app_role"{
  name               = "app_role"
  assume_role_policy = data.aws_iam_policy_document.app_role_policy.json
}

resource "aws_iam_role_policy" "app_iam_policy"{
  name               = "app_iam_policy"
  role               = aws_iam_role.app_role.id
  policy             = data.aws_iam_policy_document.app_policy_doc.json
}

resource "aws_iam_instance_profile" "app_profile" {
  name               = "app_profile"
  role               = aws_iam_role.app_role.name
}

resource "aws_iam_role_policy_attachment" "app_attach_ssm_managed_core" {
  role               = aws_iam_role.app_role.id
  policy_arn         = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
