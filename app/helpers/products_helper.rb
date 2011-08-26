module ProductsHelper
  def form_url
    action_name =~ /create|new/ ? 
      {:url => products_path } : 
      {:url => product_path(@product), :html => {:method => 'put'}}
  end
end
