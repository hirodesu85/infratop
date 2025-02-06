class Public::OrdersController < ApplicationController
  before_action :authenticate_cart, only: [:new, :confirm]

  def new
    @order = Order.new
    @customer = current_customer
  end

  def index
  end

  def show
  end

  def confirm
    address_option = params[:order][:address_option]
    if address_option == nil
      @order = Order.new
      @customer = current_customer
      render :new
    end
    
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.billing_amount = @total + @order.postage

    if address_option == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif address_option == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    end
  end
  
  def create
    cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.add_tax
        order_detail.save
      end
      redirect_to complete_orders_path
      cart_items.destroy_all
    else
      @customer = current_customer
      render :new
    end
  end

  def complete
  end

  private

  def authenticate_cart
    @cart_items = current_customer.cart_items.all
    redirect_to(cart_items_path) unless @cart_items.present?
  end

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :customer_id, :postage, :billing_amount)
  end
end
