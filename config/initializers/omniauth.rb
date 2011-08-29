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

Rails.application.config.middleware.use OmniAuth::Builder do
  url = ENV['DATABASE_COM_URL']
  provider :salesforce, url.params['oauth_key'], url.params['oauth_secret']
end
