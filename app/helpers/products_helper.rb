module ProductsHelper
  def form_url
    action_name =~ /create|new/ ?
      { :url => products_path, :html => { :multipart => true } } :
      { :url => product_path(@product), :html => {:multipart => true, :method => 'put'}}
  end
end
