Rails.configuration.stripe = {
  :publishable_key => 'pk_test_jgu0sv7MBfblCOFReUGc17Lo',#ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  :secret_key      => 'sk_test_tVa65ZCV97nztWuFgfX0NpEC rails s' #ENV['STRIPE_TEST_SECRET_KEY']
}
# end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
