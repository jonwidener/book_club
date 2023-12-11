class CommentsController < ApplicationController
    def create
      unless comment_params[:author].empty? or comment_params[:note].empty?
        Comment.create!(comment_params)        
        puts comment_params[:key_type]
        if comment_params[:key_type] == "book"
          redirect_to book_path(comment_params[:key])
        else
          chapter = Chapter.find(comment_params[:key])
          redirect_to book_chapter_path(chapter.book_id, chapter.number)
        end
      end      
    end

private

  def comment_params
    params.require(:comment).permit(:key, :key_type, :author, :note)
  end
end
