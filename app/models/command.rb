class Command < ApplicationRecord
  has_enumeration_for :vim_mode, required: true

  validates_presence_of :command, :description
  validates_uniqueness_of :command, :description

  def self.filter filter
    if filter
      where(vim_mode: filter)
    else
      all
    end
  end
end
