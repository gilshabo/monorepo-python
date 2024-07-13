resource "aws_appconfig_application" "app" {
  name        = "test-service"
  description = "AppConfig Application"

  tags = merge(
    var.tags,
    {
      Type = "aws_appconfig_application"
    },
  )
}

resource "aws_appconfig_environment" "appconfig_environment" {
  name           = var.stage
  description    = "AppConfig Environment"
  application_id = aws_appconfig_application.app.id

  tags = merge(
    var.tags,
    {
      Type = "appconfig_environment"
    },
  )
}