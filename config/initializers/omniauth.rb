class OmniAuth::Strategies::Salesforce 
  def initialize(app, consumer_key = nil, consumer_secret = nil, options = {}, &block)
    client_options = { 
      :site => 'https://' + ENV['DATABASE_COM_URL'].host,
      :authorize_path => '/services/oauth2/authorize',
      :access_token_path => '/services/oauth2/token' 
    }           
    options.merge!(:response_type => 'code', :grant_type => 'authorization_code')        
    super(app, :salesforce, consumer_key, consumer_secret, client_options, options, &block)      
  end
end 

if Rails.env.production? 
  OmniAuth.config.full_host = 'https://dbdotcom-demo--c.herokuapp.com'
end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :salesforce, 
    '3MVG9lKcPoNINVBK_LnqNBBqffM8vYaBk4C7o8nv3WFzocxGFH7PsvuVRL.zLq_XQceVq80gw_bUr2UtUkrKY', 
    '5304485318827063310'
end
