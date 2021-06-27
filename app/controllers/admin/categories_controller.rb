class Admin::CategoriesController < ApplicationController
  Rails.configuration.b = {
  :name => ENV['NAME'],
  :password => ENV['PASSWORD']
  }
  http_basic_authenticate_with name:Rails.configuration.b[:name], password:Rails.configuration.b[:password]
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
