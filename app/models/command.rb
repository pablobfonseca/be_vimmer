class Command < ApplicationRecord
  scope :normal_mode, -> { joins(:mode).merge(Mode.normal) }
  scope :visual_mode, -> { joins(:mode).merge(Mode.visual) }
  belongs_to :mode
end
