resource "aws_iam_user" "codecommit_user" {
  name = "codecommit-user"
}

resource "aws_iam_access_key" "codecommit_access_key" {
  user = aws_iam_user.codecommit_user.name
}

resource "aws_iam_user_policy" "codecommit_policy" {
  name = "codecommit-policy"
  user = aws_iam_user.codecommit_user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "codecommit:CreatePullRequest",
        "codecommit:GetRepository",
        "codecommit:DescribePullRequestEvents",
        "codecommit:GetCommentsForPullRequest",
        "codecommit:GetDifferences",
        "codecommit:GetMergeOptions",
        "codecommit:ListRepositories",
        "codecommit:PostCommentForPullRequest",
        "codecommit:UpdatePullRequestStatus"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

####AWS codecommit GetRepository
resource "aws_codecommit_repository" "my_repo" {
  repository_name = "my-repo"
}
###AWS Pull CreatePullRequest
resource "aws_codecommit_pull_request" "my_pull_request" {
  repository_name = aws_codecommit_repository.my_repo.name
  source_reference = "main"
  destination_reference = "feature-branch"
  title = "My Pull Request"
  targets {
    destination_reference = "main"
    source_reference = "feature-branch"
  }
}

resource "aws_codecommit_comment" "my_comment" {
  repository_name = aws_codecommit_repository.my_repo.name
  pull_request_id = aws_codecommit_pull_request.my_pull_request.id
  content = "Please review this pull request."
}

####Initialize your Terraform project, apply the configuration, and run the code:
terraform init
terraform apply
