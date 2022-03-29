class Story < ApplicationRecord
    acts_as_paranoid #soft-delete #1.22A
    extend FriendlyId
    friendly_id :slug_candidate, use: :slugged

    include AASM

  
  # validation
  validates :title, presence: true
  # relationships
  belongs_to :user
  has_one_attached :cover_image #1.19A
  # scope
  # method published is from AASM (1.19B)
  # with_attached_cover_image solved N + 1 problem (1.19C)
  scope :published_stories, -> { published.with_attached_cover_image.order(created_at: :desc).includes(:user) } 
  
  #instance method

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end

  end

  private
  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0,8]]
    ]
  end


end

