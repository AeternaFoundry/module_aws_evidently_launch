output "evidently_launches_id" {
  description = "Map of id values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.id if v.id != null && length(v.id) > 0 }
}
output "evidently_launches_arn" {
  description = "Map of arn values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "evidently_launches_created_time" {
  description = "Map of created_time values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.created_time if v.created_time != null && length(v.created_time) > 0 }
}
output "evidently_launches_description" {
  description = "Map of description values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.description if v.description != null && length(v.description) > 0 }
}
output "evidently_launches_execution" {
  description = "Map of execution values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.execution if v.execution != null && length(v.execution) > 0 }
}
output "evidently_launches_groups" {
  description = "Map of groups values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.groups if v.groups != null && length(v.groups) > 0 }
}
output "evidently_launches_last_updated_time" {
  description = "Map of last_updated_time values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.last_updated_time if v.last_updated_time != null && length(v.last_updated_time) > 0 }
}
output "evidently_launches_metric_monitors" {
  description = "Map of metric_monitors values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.metric_monitors if v.metric_monitors != null && length(v.metric_monitors) > 0 }
}
output "evidently_launches_name" {
  description = "Map of name values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.name if v.name != null && length(v.name) > 0 }
}
output "evidently_launches_project" {
  description = "Map of project values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.project if v.project != null && length(v.project) > 0 }
}
output "evidently_launches_randomization_salt" {
  description = "Map of randomization_salt values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.randomization_salt if v.randomization_salt != null && length(v.randomization_salt) > 0 }
}
output "evidently_launches_region" {
  description = "Map of region values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.region if v.region != null && length(v.region) > 0 }
}
output "evidently_launches_scheduled_splits_config" {
  description = "Map of scheduled_splits_config values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => one(v.scheduled_splits_config) if v.scheduled_splits_config != null && length(v.scheduled_splits_config) > 0 }
}
output "evidently_launches_status" {
  description = "Map of status values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.status if v.status != null && length(v.status) > 0 }
}
output "evidently_launches_status_reason" {
  description = "Map of status_reason values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.status_reason if v.status_reason != null && length(v.status_reason) > 0 }
}
output "evidently_launches_tags" {
  description = "Map of tags values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "evidently_launches_tags_all" {
  description = "Map of tags_all values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "evidently_launches_type" {
  description = "Map of type values across all evidently_launches, keyed the same as var.evidently_launches"
  value       = { for k, v in aws_evidently_launch.evidently_launches : k => v.type if v.type != null && length(v.type) > 0 }
}

