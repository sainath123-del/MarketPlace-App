class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:edit,:update,:destroy]
  before_action :set_product, only: [:show]
  
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @brands = Brand.all.map do |brand|
      [brand.name, brand.id]
    end 
    
  end

  def create
    @product = Product.new(product_params)

     if @product.save
      redirect_to @product
     else 
       render :new
     end
  end

  def destroy
 @product.destroy
  redirect_to products_path
  end

  def edit
    @brands = Brand.all.map do |brand|
      [brand.name, brand.id]
    end 
    
  end

  def show
  #   stripe_session = Stripe: :Checkout: :Session.create(
  #  payment_method_typs: ['card'],
  #  client_reference_is: current_user.id,
  #  customer_email: current_user.email,
  #  line_items: [{ 
  #    amount: (@product.price * 100).to_i,
  #    name: @product.name,
  #    description: @product.description,
  #    currency: 'aud',
  #    quantity: 1
  #  }],
  #  payment_intent_data: {
  #    metadata: {
  #      product_id: @product_id,
  #      user_id: current_user.id
  #    }
  #  },
  #  success_url: "#{root_url}/purchases/success?productId=#{@product.id}", 
  #  cancel_url: "#{root_url}products"
  #   )

  #   @session_id = stripe_session.id

  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else 
      render :edit
    end
  end

  private 

  def product_params
    params.require(:product).permit(:name,:price,:description,:brand_id, images: [])
  end
  
  def set_product
    @product = Product.find(params[:id])
  end 
end
