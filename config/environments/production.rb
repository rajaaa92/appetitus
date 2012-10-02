Appetitush::Application.configure do
  config.assets.precompile += %w( bootstrap.css )
  config.action_view.javascript_expansions[:defaults] = %w(foo.js bar.js)
  config.assets.compile = true
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.action_mailer.default_url_options = { :host => 'appetitus.herokuapp.com' }
end
