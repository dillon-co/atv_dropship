Rails.configuration.stripe = {
  :publishable_key => ENV['CC1_STRIPE_PUBLISHABLE'], #'pk_test_jgu0sv7MBfblCOFReUGc17Lo',
  :secret_key      => ENV['CC1_STRIPE_SECRET'] #'sk_test_tVa65ZCV97nztWuFgfX0NpEC'

  # :publishable_key =>  'pk_test_jgu0sv7MBfblCOFReUGc17Lo',
  # :secret_key      => 'sk_test_tVa65ZCV97nztWuFgfX0NpEC'
}
# end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
