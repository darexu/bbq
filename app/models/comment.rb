class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :body, presence: true
  # поле должно быть, только если не выполняется user.present? (у объекта на задан юзер)
  validates :user_name, presence: true, unless: -> { user.present? }

  scope :sort_by_newest, -> { order(created_at: :desc) }

  def user_name
    user&.name.presence || super
  end
end
