class ChaptersController < ApplicationController
  before_action :set_book
  before_action :set_chapter, only: :show

  def index
  end

  def show
    @comments = Comment.where(key: params[:id], key_type: "chapter")
  end

  def create
    puts chapter_params
    Chapter.create!(chapter_params)
  end

private
  def chapter_params
    params.require(:chapter).permit(:title, :synopsis).merge({ book_id: @book.id })
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
