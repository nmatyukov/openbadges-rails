require 'test_helper'

module OpenBadges
  class TagTest < ActiveSupport::TestCase

    test "tag attributes must not be empty" do
      tag = Tag.new
      assert tag.invalid?
      assert tag.errors[:name].any?
    end

    
  end
end
