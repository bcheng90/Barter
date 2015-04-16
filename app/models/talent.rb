class Talent < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :user
  validates :title, presence: true
  validates  :type, presence: true
  validates  :experience , presence: true
end
