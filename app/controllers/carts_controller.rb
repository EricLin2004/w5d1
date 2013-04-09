class CartsController < ApplicationController

  def show
    @cart = JSON.parse(session[:cart]) #syntax?
  end

  def update
    prev_cart = JSON.parse(session[:cart])
    cart_updates = params[:cart]

    new_cart = Hash.new(0)

# REV: Might be worth refactoring the two cart_update loops together
    cart_updates.each do |key, value|
      if prev_cart.keys.include?(key)
        new_cart[key] = prev_cart[key] + value.to_i
      else
        new_cart[key] += value.to_i if value.to_i > 0
      end
    end

    session[:cart] = new_cart.to_json

    flash[:cart_updates] = []

    cart_updates.each do |key, value|
      if value.to_i > 0
        flash[:cart_updates] << "#{value} #{key}(s) added."
      elsif value.to_i < 0
        flash[:cart_updates] << "#{value.to_i.abs} #{key}(s) removed."
      end
    end

    redirect_to products_url
  end

  def destroy
    session.delete(:cart)
  end


end
