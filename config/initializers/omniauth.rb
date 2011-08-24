require 'forcedotcom'

# Set the default hostname for omniauth to send callbacks to.
# seems to be a bug in omniauth that it drops the httpS
# this still exists in 0.2.0
#OmniAuth.config.full_host = 'http://localhost:3000/auth/forcedotcom/callback'

module OmniAuth
  module Strategies
    #tell omniauth to load our strategy
    autoload :Forcedotcom, 'lib/forcedotcom'
  end
end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :forcedotcom, 
    '3MVG9lKcPoNINVBIjB.wiPN0cNZc8CjYEv..laOBgpzAGHIzt3H8PQPkhN_bH11.KLN3LlOqBDniNJrd5emRi', 
    '1038986679638308795'
end
