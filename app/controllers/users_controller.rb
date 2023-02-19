class UsersController < ApplicationController
  
  def new
    @user = User.new(:name => "Bobby")
    @user.tag_list.add("awesome", "slick")
    @user.tag_list.remove("awesome", "slick")
    @user.save
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end
