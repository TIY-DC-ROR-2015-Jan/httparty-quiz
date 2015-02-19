class PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action { request.format = :json }

  def index
    posts = Post.all.order(created_at: :desc)
    render json: posts.as_json
  end

  def create
    user   = request.headers["Authorization"]
    number = params[:number]
    post   = Post.create! number: number, user: user
    render json: post.as_json
  end
end
