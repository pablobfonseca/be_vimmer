FactoryGirl.define do
  factory :command do

    trait :normal_mode do
      after :build do |command|
        command.mode = create(:mode, name: "Normal Mode")
        command.command = 'e'
        command.description = 'Jump to the end of a word'
      end
    end

    trait :visual_mode do
      after :build do |command|
        command.mode = create(:mode, name: "Visual Mode")
        command.command = 'o'
        command.description = 'Change between the beginning and the end of a selection'
      end
    end
  end
end
