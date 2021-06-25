class Admin::DashboardController < ApplicationController
  Rails.configuration.a = {
  :name => ENV['NAME'],
  :password => ENV['PASSWORD']
  }
  http_basic_authenticate_with name:Rails.configuration.a[:name], password:Rails.configuration.a[:password]
  def show_products
    @count_products = Product.count
  end
  def show_categories
    @count_categories = Category.count
  end
  helper_method :show_products
  helper_method :show_categories
end
