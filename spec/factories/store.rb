FactoryBot.define do
  factory :store do
    sequence(:name) {|n| "Test store #{n}"}
    sequence(:address) {|n| "Test address #{n}"}
  end
end
