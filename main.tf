resource "aws_evidently_launch" "evidently_launches" {
  for_each = var.evidently_launches

  name               = each.value.name
  project            = each.value.project
  description        = each.value.description
  randomization_salt = each.value.randomization_salt
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "groups" {
    for_each = each.value.groups
    content {
      description = groups.value.description
      feature     = groups.value.feature
      name        = groups.value.name
      variation   = groups.value.variation
    }
  }

  dynamic "metric_monitors" {
    for_each = each.value.metric_monitors != null ? each.value.metric_monitors : []
    content {
      metric_definition {
        entity_id_key = metric_monitors.value.metric_definition.entity_id_key
        event_pattern = metric_monitors.value.metric_definition.event_pattern
        name          = metric_monitors.value.metric_definition.name
        unit_label    = metric_monitors.value.metric_definition.unit_label
        value_key     = metric_monitors.value.metric_definition.value_key
      }
    }
  }

  dynamic "scheduled_splits_config" {
    for_each = each.value.scheduled_splits_config != null ? [each.value.scheduled_splits_config] : []
    content {
      dynamic "steps" {
        for_each = scheduled_splits_config.value.steps
        content {
          group_weights = steps.value.group_weights
          dynamic "segment_overrides" {
            for_each = steps.value.segment_overrides != null ? steps.value.segment_overrides : []
            content {
              evaluation_order = segment_overrides.value.evaluation_order
              segment          = segment_overrides.value.segment
              weights          = segment_overrides.value.weights
            }
          }
          start_time = steps.value.start_time
        }
      }
    }
  }
}

