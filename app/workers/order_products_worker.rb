class OrderProductsWorker
  include Sidekiq::Worker

  def perform(order)
    # Do something
    puts "This is the order. \n\n #{order}"
  end
end
