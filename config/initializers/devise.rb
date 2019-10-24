# frozen_string_literal: true

Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = '88d2cd8b3191b0b4b9afbca8486af6e9a1805060cfb94f6f2990c9c6fd53fb3d888c8535db13a409b3469f6174705dac0ee86873c6261dc921d2fb8d8893b8ba'

  require 'devise/orm/active_record'

  config.mailer_sender = 'example@example.com'
  config.mailer = 'Devise::Mailer'
  config.parent_mailer = 'ActionMailer::Base'
  config.authentication_keys = [:username]
  config.strip_whitespace_keys = [:username]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
