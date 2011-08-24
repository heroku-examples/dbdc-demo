class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.dbdc_client_from_env
    Databasedotcom::Client.new.tap do |c|
      c.password += ENV['DATABASE_COM_SECRET']
      c.authenticate or raise "Could not connect to Database.com"
    end
  end
end
