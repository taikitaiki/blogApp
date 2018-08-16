class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @blogs = current_user.blogs.order("created_at DESC")
  end
end
