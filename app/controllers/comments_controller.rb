class CommentsController < ApplicationController
    def create
        puts params
        puts comment_params
        Comment.create!(comment_params)        
    end

private

  def comment_params
    params.require(:comment).permit(:key, :key_type, :author, :note)
  end
end
