FactoryBot.define do
  factory :item do
    association :user
    title         { 'タイトル' }
    introduction  { '紹介' }
    category   { '2' }
    status     { '2' }
    postage    { '2' }
    area       { '2' }
    shipping   { '2' }
    price      { '3000' }
    #  trait(:image) do
    #     image { Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.jpg')) }
    #  end
  end
end
