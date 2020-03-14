FactoryBot.define do
  factory :freight do
    state { 'SP' }
    weight_min { 110 }
    weight_max { 120 }
    cost { 500 }
  end
end