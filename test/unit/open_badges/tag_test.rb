require 'test_helper'

module OpenBadges
  class TagTest < ActiveSupport::TestCase
    setup do
      @java_tag = open_badges_tags(:java)
    end

    test "tag attributes must not be empty" do
      tag = Tag.new
      assert tag.invalid?
      assert tag.errors[:name].any?
    end

    test "tag name must be unique" do
      tag = Tag.new(name: @java_tag.name)
      assert !tag.save
      assert_equal I18n.translate('activerecord.errors.messages.taken'),
                   tag.errors[:name].join('; ')
    end

    test "tag must not be destroyed if associated with a badge" do
      assert !@java_tag.destroy
    end
  end
end