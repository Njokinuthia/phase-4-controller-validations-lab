class AuthorsController < ApplicationController
  # rescue_from ActiveRecord::RecordInvalid, with: :render_error_message

  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end


  private

  # def render_error_message(invalid)
  #   render json: { errors: invalid.record.errors.full_messages}, status: :unprocessed_entity
  # end
  
  def author_params
    params.permit(:email, :name)
  end
  
end
