# frozen_string_literal: true

class ChaptersController < ApplicationController
  before_action :set_book
  before_action :set_chapter, only: :show

  def index; end

  def show
    @comments = Comment.where(key: "#{@book.id}|#{@chapter.id}", key_type: 'chapter')
  end

  def create
    Chapter.create!(chapter_params)
  end

  private

  def chapter_params
    params.require(:chapter).permit(:number, :title, :synopsis).merge({ book_id: @book.id })
  end

  def set_chapter
    @chapter = Chapter.where(number: params[:id], book_id: params[:book_id]).first
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
