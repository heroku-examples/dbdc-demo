class WelcomeController < ApplicationController
  before_filter :protect!

  def index
    @products = Product.all
  end

  def search
    begin
      @products = dbdc_client.search('FIND {' + params[:q].to_s + '}')
    rescue Databasedotcom::SalesForceError => boom
      @error = boom.message
    end
    render 'index'
  end
end
