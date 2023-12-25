# frozen_string_literal: true

class DrawerComponent < ViewComponent::Base
  def initialize(book)
    @book = book
    super
  end
end
