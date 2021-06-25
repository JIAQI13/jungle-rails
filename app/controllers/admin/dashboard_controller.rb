class Admin::DashboardController < ApplicationController
  Rails.configuration.a = {
  :name => ENV['NAME'],
  :password => ENV['PASSWORD']
  }
  http_basic_authenticate_with name:Rails.configuration.a[:name], password:Rails.configuration.a[:password]
  def show
  end
end
