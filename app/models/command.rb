class Command < ApplicationRecord
  scope :normal_mode, -> { joins(:mode).merge(Mode.normal) }
  scope :visual_mode, -> { joins(:mode).merge(Mode.visual) }
  belongs_to :mode

  validates_presence_of :mode_id, :command, :description
  validates_uniqueness_of :command, :description
end
