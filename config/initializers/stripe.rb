if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_TEST_SECRET_KEY'],
  }
else
  Rails.configuration.stripe = {
    publishable_key: Rails.application.credentials.dig(:stripe, :development, :public_key),
    secret_key: Rails.application.credentials.dig(:stripe, :development, :private_key),
    signing_secret: Rails.application.credentials.dig(:stripe, :development, :signing_secret)
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

puts "Stripe Publishable Key: #{Rails.configuration.stripe[:publishable_key]}"
puts "Stripe Secret Key: #{Rails.configuration.stripe[:secret_key]}"
