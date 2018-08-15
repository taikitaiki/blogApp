class BlogsController < ApplicationController

  def index
    @blogs = Blog.find(1)
  end
end
