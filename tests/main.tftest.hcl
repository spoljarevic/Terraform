variables {
  project_name = "demo"
  environment  = "staging"
}

run "name_has_expected_prefix" {
  command = plan

  assert {
    condition     = startswith(local.name, "demo-staging-")
    error_message = "Generated name must start with <project>-<environment>-."
  }
}

run "config_file_is_created" {
  command = apply

  assert {
    condition     = jsondecode(local_file.config.content).environment == "staging"
    error_message = "Config file must contain the environment."
  }
}

run "rejects_invalid_environment" {
  command = plan

  variables {
    environment = "qa"
  }

  expect_failures = [var.environment]
}
