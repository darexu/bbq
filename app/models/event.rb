class Event < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :subscriptions

  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true, format: { with: /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/ }
  validate :datetime_in_future?, on: [:update, :create]

  private
  def datetime_in_future?
    if datetime < Time.now
      errors.add(:datetime, I18n.t('errors.messages.not_saved.wrong_date_format'))
    end
  end
end
