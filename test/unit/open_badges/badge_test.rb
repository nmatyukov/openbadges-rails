require 'test_helper'

module OpenBadges
  class BadgeTest < ActiveSupport::TestCase

    setup do
      @android_badge = open_badges_badges(:android)
      @ios_badge = open_badges_badges(:ios)
    end
    
    test "badge attributes must not be empty" do
      badge = Badge.new
      assert badge.invalid?
      assert badge.errors[:name].any?
      assert badge.errors[:image].any?
    end

    def new_badge(image_url)
      Badge.new(name: "Windows",
                image: image_url)
    end

    test "badge image url validity" do
      ok_url = %w{ windows.gif windows.jpg windows.png windows.jpeg WINDOWS.JPG
        WINDOWS.pNg http://i/am/not/sad/wInDoWs.Gif }
      bad_url = %w{ windows.doc windows.gif/more windows.gif.more windows.pngg}

      ok_url.each do |name|
        assert new_badge(name).valid?, "#{name} shouldn't be invalid"
      end
      bad_url.each do |name|
        assert new_badge(name).invalid?, "#{name} shouldn't be valid"
      end
    end

    test "badge name must be unique" do
      badge = Badge.new(name: @android_badge.name,
                        image: 'jellybean.png')
      assert !badge.save
      assert_equal I18n.translate('activerecord.errors.messages.taken'),
                   badge.errors[:name].join('; ')
    end

    test "destroys all associated badge_tag when badge is destroyed" do
      assert_difference 'BadgeTag.count', -2 do
        @ios_badge.destroy
      end
    end

    test "destroys all associated badge_alignment when badge is destroyed" do
      assert_difference 'BadgeAlignment.count', -2 do
        @ios_badge.destroy
      end
    end
  end
end
