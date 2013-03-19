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

    test "destroys all associated badge_alignment when alignment is destroyed" do

      num_before = BadgeAlignment.where("alignment_id = #{@engin_alignment.id}").count
      @engin_alignment.destroy
      num_after = BadgeAlignment.where("alignment_id = #{@engin_alignment.id}").count
      
      assert (num_before != num_after && num_after == 0)
    end
  end
end
