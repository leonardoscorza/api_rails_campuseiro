class Api::V1::CommentsController < Api::V1::ApiController
  before_action :authenticate_user
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params.merge(user: current_user))
    
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy  
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end
end
