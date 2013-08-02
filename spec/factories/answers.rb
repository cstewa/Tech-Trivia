# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    content "MyString"
    question nil
    is_correct "MyString"
  end
end
