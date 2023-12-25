# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    return if invalid_comment?

    Comment.create!(comment_params)
    if comment_params[:key_type] == 'book'
      redirect_to book_path(comment_params[:key])
    else
      chapter = Chapter.find(comment_params[:key])
      redirect_to book_chapter_path(chapter.book_id, chapter.number)
    end
  end

  private

  def invalid_comment?
    comment_params[:author].empty? || comment_params[:note].empty?
  end

  def comment_params
    params.require(:comment).permit(:key, :key_type, :author, :note)
  end
end
