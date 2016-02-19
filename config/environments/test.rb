Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.server_static_files = true
  config.static_cache_control = 'public, max-age=3600'
  config.consider_all_request_local = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controler.allow_forgery_protection = false
  config.action_mailer.delivery_method = :test
  config.active_support.test_order = :random
  config.active_support.deprecation = :stderr
end
