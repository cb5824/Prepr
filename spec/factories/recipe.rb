FactoryBot.define do
  factory :recipe do
    sequence(:name) {|n| "Test recipe #{n}"}
    servings 2
    duration 40
    directions "Put things in a bowl, mix it up, bake, serve, delicious"
  end
end
