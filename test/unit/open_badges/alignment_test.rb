require 'test_helper'

module OpenBadges
  class AlignmentTest < ActiveSupport::TestCase
    setup do
      @engin_alignment = open_badges_alignments(:engin)
    end

    test "alignment attributes must not be empty" do
      alignment = Alignment.new
      assert alignment.invalid?
      assert alignment.errors[:name].any?
      assert alignment.errors[:url].any?
    end

    test "alignment name must be unique" do
      alignment = Alignment.new(name: @engin_alignment.name,
                                url: 'someurl.com')
      assert !alignment.save
      assert_equal I18n.translate('activerecord.errors.messages.taken'),
                   alignment.errors[:name].join('; ')
    end

    test "alignment must not be destroyed if associated with a badge" do
      assert !@engin_alignment.destroy
    end
  end
end
