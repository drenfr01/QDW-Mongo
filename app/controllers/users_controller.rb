class UsersController < ApplicationController
  def show
    @name = params[:id]
    @user = User.where(:name => params[:id]).count
    @title = 'Test'
  end
end
