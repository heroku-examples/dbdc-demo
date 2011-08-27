class ProductsController < ApplicationController
  before_filter :protect!

  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create

    respond_to do |format|
      begin
        @product = Product.create(Product.coerce_params(params[:product]))
        format.html { redirect_to(product_path(@product), :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => product_path(@product) }
      rescue Databasedotcom::SalesForceError => e
        @errors  = [e.message]
        format.html { render :action => "new" }
        format.xml  { render :xml => @errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    require 'ruby-debug'; debugger
    if upload = params["product"].delete("image_url__c")
      filename = upload.original_filename
      data = upload.tempfile.read
      params["product"]["image_url__c"] = S3Uploader.upload(filename, data)
    end
    @product = Product.find(params[:id])

    respond_to do |format|
      begin
        @product.update_attributes(Product.coerce_params(params[:product]))
        format.html { redirect_to(product_path(@product), :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      rescue Databasedotcom::SalesForceError => e
        @errors  = [e.message]
        format.html { render :action => "edit" }
        format.xml  { render :xml => @errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.delete

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
