class Admin::CategoriesController < ApplicationController
    Rails.configuration.b = {
    :name => ENV['NAME'],
    :password => ENV['PASSWORD']
    }
    http_basic_authenticate_with name:Rails.configuration.b[:name], password:Rails.configuration.b[:password]
    def index
      @categories = Categories.name(id: :desc).all
    end
  
    def new
      @categories = Categories.new
    end
  
    def create
      @categories = Categories.new(categories_params)
  
      if @categories.save
        redirect_to [:admin, :categories], notice: 'categories created!'
      else
        render :new
      end
    end
  
    
    private
  
    def categories_params
      params.require(:categories).permit(
        :id,
        :name,
        :createed_at,
        :updated_at
      )
    end
  
  end
  