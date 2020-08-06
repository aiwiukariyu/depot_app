class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    #@time= Time.now
    #if session[:user_id]
    #  @username = User.find(session[:user_id]).name
    #end
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
