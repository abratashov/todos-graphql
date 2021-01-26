FactoryBot.define do
  factory :task do
    name { FFaker::DizzleIpsum.word }
    done { false }
    project { nil }
    position { 1 }
  end
end
