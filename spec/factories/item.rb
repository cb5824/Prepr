FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "Test Item #{n}"}
  end
end
