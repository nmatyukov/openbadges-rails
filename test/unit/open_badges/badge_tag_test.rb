require 'test_helper'

module OpenBadges
  class BadgeTagTest < ActiveSupport::TestCase

    test "badge_tag attribute must not be empty" do

      badge_tag = BadgeTag.new
      assert badge_tag.invalid?
      assert badge_tag.errors[:badge_id].any?
      assert badge_tag.errors[:tag_id].any?
    end
  end
end
