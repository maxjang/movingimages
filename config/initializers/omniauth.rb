Rails.application.config.middleware.use OmniAuth::Builder do
  if (Rails.env == 'development' || Rails.env == 'test')
    provider :instagram, 'c6dc5a77db6942f3a22c9e6a469972b2', '08d87c472e9b4f95988a04524580d0f1'
  elsif(Rails.env == 'production')
    provider :instagram, '6aa594edd5c042aeb6d5e940d8bcd85c', '5bb315185225491caf9ccbf0868befd0'
  end
end