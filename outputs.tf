output "name" {
  description = "Generated resource name."
  value       = local.name
}

output "config_path" {
  description = "Path of the generated config file."
  value       = local_file.config.filename
}
