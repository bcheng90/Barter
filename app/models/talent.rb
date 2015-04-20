class Talent < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :user
  validates :title, presence: true
  validates  :type, presence: true
  validates  :experience , presence: true

  has_attached_file :image, :styles => {large: "300x300>"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
