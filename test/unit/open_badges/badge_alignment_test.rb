require 'test_helper'

module OpenBadges
  class BadgeAlignmentTest < ActiveSupport::TestCase
    
    setup do
      @android_badge = open_badges_badges(:android)
      @mvc_alignment = open_badges_alignments(:mvc)
    end

    test "badge_alignment attribute must not be empty" do
      badge_alignment = BadgeAlignment.new
      assert badge_alignment.invalid?
      assert badge_alignment.errors[:badge_id].any?
      assert badge_alignment.errors[:alignment_id].any?
    end

    test "badge_alignment must reference a valid badge and tag" do
      badge_alignment = BadgeAlignment.new(badge_id: @android_badge.id,
                               alignment_id: @mvc_alignment.id)
      assert badge_alignment.valid?

      badge_alignment = BadgeAlignment.new(badge_id: @android_badge.id,
                               alignment_id: 99)
      assert badge_alignment.invalid?
    end
  end
end
