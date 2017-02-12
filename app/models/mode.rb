class Mode < ApplicationRecord
  scope :normal, -> { where(name: 'Normal Mode') }
  scope :visual, -> { where(name: 'Visual Mode') }
  has_many :commands
end
