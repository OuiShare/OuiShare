FactoryGirl.define do
  factory :language do
    name "English"
    english_name  "English"
    visible true
    slug "en"
  end

  factory :occupation do
    name "student"
  end

  factory :admin, class: User do
    fname "Admin"
    name  "User"
    email "x@haldjas.org"
    password "password"
    association :language, factory: :language
    country "AL"
    gender "1"
    city "city"
    association :occupation, factory: :occupation
    admin true
  end

  factory :user, class: User do
    fname "User"
    name  "User"
    email "t@haldjas.org"
    password "password"
    association :language, factory: :language
    country "AL"
    gender "1"
    city "city"
    association :occupation, factory: :occupation
    admin false
  end

end