class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.includes(:user).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog =Blog.create(name: blog_params[:name], content: blog_params[:content], user_id: current_user.id)
  end

  def destroy
    blog = Blog.find(params[:id])
      if blog.user.id == current_user.id
        blog.destroy
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
      if blog.user.id == current_user.id
        blog.update(blog_params)
      end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
  def blog_params
    params.require(:blog).permit(:name, :content, :user_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
