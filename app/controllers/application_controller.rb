class ApplicationController < ActionController::Base
  include Databasedotcom::Rails::Controller
  protect_from_forgery
  before_filter :establish_connection

  def establish_connection
    return unless session[:auth]
    begin
      @client = Databasedotcom::Client.new
      @client.username = @client.password = nil
      session[:token] = @client.authenticate session[:auth]
      #check connection w. list_sobjects
      @client.list_sobjects
      self.class.dbdc_client = @client 
    rescue Databasedotcom::SalesForceError => e
      #should retry with refresh_token
      session[:auth] = false
      redirect_to '/'
    end
  end

  def protect!
    return if logged_in?
    redirect_to :controller => "sessions", :action => 'new'
  end

  def logged_in?
    session[:auth]
  end

  def self.const_missing(sym)
    custom_obj = sym.to_s + '__c'
    if sobject_types.include?(custom_obj)
      dbdc_client.materialize(custom_obj)
    else
      super
    end
  end
end
