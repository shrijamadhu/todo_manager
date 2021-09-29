class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render plain: User.all.map{|user| user.to_pleasant_string}.join("\n")
  end
  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end
  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name,email: email,password: password)
    render plain: "hey! created new user with id #{new_user.id}"
  end
  def login
    email = params[:email]
    password = params[:password]
    new_user = User.find_by(email: email,password: password)
    render plain: new_user.present?
  end
end
