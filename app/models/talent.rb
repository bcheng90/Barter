class Talent < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates  :type, presence: true
  validates  :experience , presence: true
end
