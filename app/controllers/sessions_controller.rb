class SessionsController < ApplicationController
  def create
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']
    redirect_to '/'
  end

  def fail
    render :text =>  request.env["omniauth.auth"].to_yaml
  end
end
