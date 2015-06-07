class UsersController < ApplicationController
  skip_before_action :auth, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params["id"])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params["user"])
    if @user.valid?
      redirect_to users_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params["id"])
  end

  def update
    @user = User.find_by(id: params["id"])
    @user.update(params["user"])
    redirect_to users_path
  end

  def destroy
    @user = User.find_by(id: params["id"])
    @user.destroy
    redirect_to users_path
  end

end