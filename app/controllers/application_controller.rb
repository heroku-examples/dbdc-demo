class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.dbdc_client
    @dbdc_client ||= Databasedotcom::Client.new.tap do |c|
      c.password += ENV['DATABASE_COM_SECRET']
      c.authenticate or raise "Could not connect"
    end
  end
end
