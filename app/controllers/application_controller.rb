class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # basic認証
  http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "production"
end
