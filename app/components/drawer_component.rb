# frozen_string_literal: true

class DrawerComponent < ViewComponent::Base # rubocop:disable Style/Documentation
  def initialize(book)
    @book = book
    super
  end
end
