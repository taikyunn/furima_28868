FactoryBot.define do
  factory :user_purchase do
    prefecture_id { '3' }
    postal_code   { '123-4567' }
    city          { '港区六本木' }
    address       { '麻布1-1-1' }
    building      { '六本木ヒルズ' }
    phone_number  { '08011111111' }
    purchase_id   { '1' }
    user_id       { '1' }
    item_id       { '1' }
    token         { '1' }
  end
end
