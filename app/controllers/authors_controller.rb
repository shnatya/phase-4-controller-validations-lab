class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unproccesable_entity_response

  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def render_unproccesable_entity_response(invalid)
    render json: {erros: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
  def author_params
    params.permit(:email, :name)
  end
  
end
