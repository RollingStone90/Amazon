class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  before_filter :categories, :brands

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end  

  def categories
  	@categories = Category.all
	end
  def brands
    @brands = Product.pluck(:brand).sort.uniq
  end

  def configure_permitted_parameters

  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, 
     :password_confirmation, :role) }

  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, 
     :password_confirmation, :current_password, :role) }
	end


end

