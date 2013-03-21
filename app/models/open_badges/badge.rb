module OpenBadges
  class Badge < ActiveRecord::Base
    has_many :badge_tags, dependent: :destroy
    has_many :tags, through: :badge_tags
    has_many :badge_alignments, dependent: :destroy
    has_many :alignments, through: :badge_alignments

    attr_accessible :criteria, :description, :image, :name, :tag_ids, :alignment_ids

    validates :name, :image, presence: true
    validates :name, uniqueness: true
    validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpe?g|png)$}i,
      message: 'must be a ULR for GIF, JPG, JPEG or PNG images'
    }

    # Tag List
    attr_writer :tag_list
    attr_accessible :tag_list
    before_save :save_tag_list

    def tag_list
      @tag_list || tags.map(&:name).join(", ")
    end

    def save_tag_list
      if @tag_list

        tag_name_array = @tag_list.split(/,/).uniq
        full_tag_name_array = Tag.get_tag_list

        if not tag_name_array.blank?
          tag_name_array.each do |name|
            name = name.strip

            # If tag name does not exists, create 
            if not full_tag_name_array.include?(name)
              Tag.create(name: name)
            end
          end

          self.tags = Tag.where("name IN (?)", tag_name_array)
        else
          self.badge_tags.destroy_all
        end

        # self.tags = @tag_list.split(/,/).uniq.map do |name|
        #   Tag.where(:name => name).first || Tag.create(:name => name.strip)
        # end
      end
    end

    public
    def url
      OpenBadges::Engine.routes.url_helpers.badge_url({
        :id => self.id,
        :format => :json,
        :host => Rails.application.routes.default_url_options[:host]
      })
    end

    public
    def as_json(options = nil)
      json = super(
        :methods => [:badge_tags, :badge_alignments],
        :only => [:name, :image, :criteria, :badge_tags, :badge_alignments, :description]
      ).reject{ |key, value| value.nil? || value.empty? }
      json['tags'] = json.delete(:badge_tags) unless json[:badge_tags].nil?
      json['alignment'] = json.delete(:badge_alignments) unless json[:badge_alignments].nil?
      json['issuer'] = OpenBadges::Engine.routes.url_helpers.organization_url({
        :format => :json,
        :host => Rails.application.routes.default_url_options[:host]
      })
      json
    end
  end
end