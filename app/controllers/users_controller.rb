class UsersController < ApplicationController
  def new
    #page for adding a new user
  end

  def show
    @user = User.find(params[:id])
  end
end