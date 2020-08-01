class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :body, presence: true
  # поле должно быть, только если не выполняется user.present? (у объекта на задан юзер)
  #validates :user_name, presence: true, unless: 'user.present?'
  validates :user_name, presence: true, unless: -> { user.present? }

  def user_name
    if user.present?
      user.internal_metadata_table_name
    else
      super
    end
  end
end