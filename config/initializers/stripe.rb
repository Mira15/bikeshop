if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_xfLD36cY55djIki7gtY5oeSn',
    :secret_key => 'sk_test_9cxKqWsZYC12MqK39c0xC8B7'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]