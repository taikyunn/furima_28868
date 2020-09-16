FactoryBot.define do
  factory :item do
    association :user
    title         { 'タイトル' }
    introduction  { '紹介' }
    category_id   { '3' }
    status_id     { '3' }
    postage_id    { '3' }
    area_id       { '3' }
    shipping_id   { '3' }
    price { '3000' }
    #  trait(:image) do
    #     image { Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.jpg')) }
    #  end
  end
end
