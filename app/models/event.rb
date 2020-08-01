class Event < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :subscriptions

  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true
  validate :datetime_in_future?, on: :update

  private
  def datetime_in_future?
    if datetime < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
