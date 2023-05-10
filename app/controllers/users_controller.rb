class UsersController < ApplicationController
  def index
    @users = User.all

    render :index
  end

  def show
    @user = User.find_by(id: params[:id])

    render :show
  end

  def create
    @user = User.create(
      name: params[:name].capitalize,
      email: params[:email].downcase,
      image: params[:image],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )

    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    @user.update(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
      image: params[:image] || @user.image,
    )

    render :show
  end

  def destroy
    @user = User.find_by(id: params[:id])

    @user.destroy

    render json: { message: "User sucessfully deleted" }
  end

  def update_password
    @user = User.find_by(id: params[:id])

    @user.update(
      password: params[:name],
      password_confirmation: params[:password_confirmation],
    )
    render :show
    # render json: { message: "Password has been updated" }
  end
end
