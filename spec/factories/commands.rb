FactoryGirl.define do
  factory :command do
    sequence(:command) {|x| "e#{x}"}
    sequence(:description) {|x| "Description Command#{x}"}

    trait :normal_mode do
      after :build do |command|
        command.vim_mode = VimMode::NORMAL_MODE
      end
    end

    trait :visual_mode do
      after :build do |command|
        command.vim_mode = VimMode::VISUAL_MODE
      end
    end
  end
end
