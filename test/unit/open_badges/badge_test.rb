require 'test_helper'

module OpenBadges
  class BadgeTest < ActiveSupport::TestCase
    
    test "badge attributes must not be empty" do
      badge = Badge.new
      assert badge.invalid?
      assert badge.errors[:name].any?
      assert badge.errors[:image].any?
    end

    def new_badge(image_url)
      Badge.new(name: "Smiley",
                  image: image_url)
    end

    test "badge image url validity" do

      ok_url = %w{ smiley.gif smiley.jpg smiley.png smiley.jpeg SMILEY.JPG
        SMILEY.pNg http://i/am/not/sad/sMiLeY.Gif }

      bad_url = %w{ smiley.doc smiley.gif/more smiley.gif.more smiley.pngg}

      ok_url.each do |name|
        assert new_badge(name).valid?, "#{name} shouldn't be invalid"
      end

      bad_url.each do |name|
        assert new_badge(name).invalid?, "#{name} shouldn't be valid"
      end
    end
  end
end
