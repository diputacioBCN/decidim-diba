FactoryGirl.define do
  factory :census, class: Decidim::Censuses::Census do
    id_document '123456789A'
    birthdate '2017/11/22'
  end
end
