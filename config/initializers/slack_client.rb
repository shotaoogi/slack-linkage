# frozen_string_literal: true

Slack.configure do |config|
  config.token = ENV['SLACK_BOT_TOKEN']
end

Slack::Web::Client.config do |config|
  config.user_agent = 'Slack Ruby Client/1.0'
end

Slack::Events.configure do |config|
  config.signing_secret = ENV['SLACK_SIGNING_SECRET']
  config.signature_expires_in = 12345
end