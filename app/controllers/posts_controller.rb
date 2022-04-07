class PostsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccesable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def render_unproccesable_entity_response(invalid)
    render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def post_params
    params.permit(:category, :content, :title)
  end

end
