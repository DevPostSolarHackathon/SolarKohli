# config/initializers/facebook_messenger.rb
Facebook::Messenger.configure do |config|
  config.access_token = "EAAF1EHvxHfcBANQFakGoJCRrGT8NXttiXfgMEP569YFEmJ1icfFyirDPjHgZCegJYbHGEzyf1VuXOtwg8RZCDEJL31ymSrwxI2sgjVcwSNGUfJDXQ5NlU0YkTIow51shlhgNwdfZCDqoGdsogZC3DoRDKBejr6a5MiZCkkqmZAwwZDZD"
  config.app_secret   = "0d41c10e8a29104dbc9e4e1a2a5658ae"
  config.verify_token = "nothing"
end
unless Rails.env.production?
  bot_files = Dir[Rails.root.join("app", "bot", "**", "*.rb")]
  bots_reloader = ActiveSupport::FileUpdateChecker.new(bot_files) do
    bot_files.each{ |file| require_dependency file }
  end
  ActionDispatch::Callbacks.to_prepare do
    bots_reloader.execute_if_updated
  end
  bot_files.each { |file| require_dependency file }
end