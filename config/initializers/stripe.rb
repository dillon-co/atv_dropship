Rails.configuration.stripe = {
  :publishable_key => 'pk_test_jgu0sv7MBfblCOFReUGc17Lo',#ENV['CC1_STRIPE_PUBLISHABLE'],
  :secret_key      => 'sk_test_tVa65ZCV97nztWuFgfX0NpEC rails s' #ENV['CC1_STRIPE_SECRET']
}
# end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
