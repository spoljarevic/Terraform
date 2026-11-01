locals {
  name = "${var.project_name}-${var.environment}-${random_pet.this.id}"
}

resource "random_pet" "this" {
  length = 2
}

resource "local_file" "config" {
  filename        = "${path.module}/out/${local.name}.json"
  file_permission = "0640"
  content = jsonencode({
    name        = local.name
    project     = var.project_name
    environment = var.environment
  })
}
