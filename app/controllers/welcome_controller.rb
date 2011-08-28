class WelcomeController < ApplicationController
  before_filter :protect!

  def index
    @products = Product.all
  end

  def search
    begin
      query = params[:q].split.map{ |x| "*#{x}*"}.join(' AND ')
      @products = dbdc_client.search('FIND {' + query + '}')
    rescue Databasedotcom::SalesForceError => boom
      @error = boom.message
    end
  end
end
