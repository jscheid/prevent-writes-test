require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.hosts = ["web:3000", "0.0.0.0", "localhost:3000"]
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.action_view.annotate_rendered_view_with_filenames = true
  config.action_view.logger = nil
  config.action_controller.raise_on_missing_callback_actions = true
end
