class SessionsController < ApplicationController
  def create
    if params['submit'] 
      session[:auth] = {:username => params[:username], 
                        :password => params[:password] + params[:secret]}
    else
      session[:auth] = request.env['omniauth.auth']
    end
    render :text => session[:auth].inspect
    #redirect_to '/'
  end

  def fail
    render :text =>  request.env["omniauth.auth"].to_yaml
  end

  def logout
    session[:auth] = nil
    redirect_to '/'
  end
end
