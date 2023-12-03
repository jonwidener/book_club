# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
    def initialize(key: nil, key_type: nil, comment: nil)
        @key = key
        @key_type = key_type
        @comment = comment
    end
end
