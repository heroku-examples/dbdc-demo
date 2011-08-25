module ApplicationHelper
  def logged_in?
    session[:auth]
  end
end
