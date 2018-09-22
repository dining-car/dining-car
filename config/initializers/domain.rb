# frozen_string_literal: true

port     = ENV.fetch('PORT') { 3000 }
host     = ENV.fetch('DOMAIN') { "localhost:#{port}" }

Rails.application.configure do
  https    = Rails.env.production?

  config.action_mailer.default_url_options = { host: host, protocol: https ? 'https://' : 'http://' }
end
