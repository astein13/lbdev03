OmniAuth.config.logger = Rails.logger


# Staging
#Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :facebook, '166811116787630', 'a1abe18a2e80a7b7aa83e11a8b16adc4'
#end


#Local
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '206130946151276', '6ea925d5c0f83b29abcda46ec0d01cbf'
end