require 'test_helper'

module OpenBadges
  class BadgeTagTest < ActiveSupport::TestCase
    
    setup do
      @android_badge = open_badges_badges(:android)
      @green_tag = open_badges_tags(:green)
    end

    test "badge_tag attribute must not be empty" do
      badge_tag = BadgeTag.new
      assert badge_tag.invalid?
      assert badge_tag.errors[:badge_id].any?
      assert badge_tag.errors[:tag_id].any?
    end

    test "badge_tag must reference a valid badge and tag" do
      badge_tag = BadgeTag.new(badge_id: @android_badge.id,
                               tag_id: @green_tag.id)
      assert badge_tag.valid?

      badge_tag = BadgeTag.new(badge_id: @android_badge.id,
                               tag_id: 99)
      assert badge_tag.invalid?
    end
  end
end