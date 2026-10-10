variable "evidently_launches" {
  description = <<EOT
Map of evidently_launches, attributes below
Required:
    - name
    - project
    - groups (block):
        - description (optional)
        - feature (required)
        - name (required)
        - variation (required)
Optional:
    - description
    - randomization_salt
    - region
    - tags
    - tags_all
    - metric_monitors (block):
        - metric_definition (required, block):
            - entity_id_key (required)
            - event_pattern (optional)
            - name (required)
            - unit_label (optional)
            - value_key (required)
    - scheduled_splits_config (block):
        - steps (required, block):
            - group_weights (required)
            - segment_overrides (optional, block):
                - evaluation_order (required)
                - segment (required)
                - weights (required)
            - start_time (required)
EOT

  type = map(object({
    name               = string
    project            = string
    description        = optional(string)
    randomization_salt = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    groups = list(object({
      description = optional(string)
      feature     = string
      name        = string
      variation   = string
    }))
    metric_monitors = optional(list(object({
      metric_definition = object({
        entity_id_key = string
        event_pattern = optional(string)
        name          = string
        unit_label    = optional(string)
        value_key     = string
      })
    })))
    scheduled_splits_config = optional(object({
      steps = list(object({
        group_weights = map(number)
        segment_overrides = optional(list(object({
          evaluation_order = number
          segment          = string
          weights          = map(number)
        })))
        start_time = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        length(v.groups) >= 1 && length(v.groups) <= 5
      )
    ])
    error_message = "Each groups list must contain between 1 and 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.metric_monitors == null || (length(v.metric_monitors) <= 3)
      )
    ])
    error_message = "Each metric_monitors list must contain at most 3 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.scheduled_splits_config == null || (length(v.scheduled_splits_config.steps) >= 1 && length(v.scheduled_splits_config.steps) <= 6)
      )
    ])
    error_message = "Each steps list must contain between 1 and 6 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.scheduled_splits_config == null || (alltrue([for item in v.scheduled_splits_config.steps : (item.segment_overrides == null || (length(item.segment_overrides) <= 6))]))
      )
    ])
    error_message = "Each segment_overrides list must contain at most 6 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        alltrue([for item in v.groups : ((length(item.feature) >= 1 && length(item.feature) <= 127) && (can(regex("^[0-9A-Za-z_.-]*$", item.feature))))])
      )
    ])
    error_message = "all of: must be between 1 and 127 characters; alphanumeric and can contain hyphens, underscores, and periods"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        alltrue([for item in v.groups : ((length(item.variation) >= 1 && length(item.variation) <= 127) && (can(regex("^[0-9A-Za-z_.-]*$", item.variation))))])
      )
    ])
    error_message = "all of: must be between 1 and 127 characters; alphanumeric and can contain hyphens, underscores, and periods"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.metric_monitors == null || alltrue([for item in v.metric_monitors : (length(item.metric_definition.entity_id_key) >= 1 && length(item.metric_definition.entity_id_key) <= 256)])
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.metric_monitors == null || alltrue([for item in v.metric_monitors : (item.metric_definition.event_pattern == null || ((length(item.metric_definition.event_pattern) >= 0 && length(item.metric_definition.event_pattern) <= 1024) && (can(jsondecode(item.metric_definition.event_pattern)))))])
      )
    ])
    error_message = "all of: must be between 0 and 1024 characters; must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.metric_monitors == null || alltrue([for item in v.metric_monitors : (item.metric_definition.unit_label == null || (length(item.metric_definition.unit_label) >= 1 && length(item.metric_definition.unit_label) <= 256))])
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.metric_monitors == null || alltrue([for item in v.metric_monitors : (length(item.metric_definition.value_key) >= 1 && length(item.metric_definition.value_key) <= 256)])
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        (length(v.project) >= 0 && length(v.project) <= 2048) && (can(regex("(^[0-9A-Za-z_.-]*$)|(arn:[^:]*:[^:]*:[^:]*:[^:]*:project/[0-9A-Za-z_.-]*)", v.project)))
      )
    ])
    error_message = "all of: must be between 0 and 2048 characters; name or arn of the project"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.randomization_salt == null || (length(v.randomization_salt) >= 0 && length(v.randomization_salt) <= 127)
      )
    ])
    error_message = "must be between 0 and 127 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.scheduled_splits_config == null || (alltrue([for item in v.scheduled_splits_config.steps : (alltrue([for x in item.group_weights : x >= 0 && x <= 100000]))]))
      )
    ])
    error_message = "must be between 0 and 100000"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.scheduled_splits_config == null || (alltrue([for item in v.scheduled_splits_config.steps : (item.segment_overrides == null || alltrue([for item in item.segment_overrides : ((length(item.segment) >= 0 && length(item.segment) <= 2048) && (can(regex("(^[0-9A-Za-z_.-]*$)|(arn:[^:]*:[^:]*:[^:]*:[^:]*:segment/[0-9A-Za-z._-]*)", item.segment))))]))]))
      )
    ])
    error_message = "all of: must be between 0 and 2048 characters; name or arn of the segment"
  }
  validation {
    condition = alltrue([
      for k, v in var.evidently_launches : (
        v.scheduled_splits_config == null || (alltrue([for item in v.scheduled_splits_config.steps : (item.segment_overrides == null || alltrue([for item in item.segment_overrides : (alltrue([for x in item.weights : x >= 0 && x <= 100000]))]))]))
      )
    ])
    error_message = "must be between 0 and 100000"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

