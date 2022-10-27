FactoryBot.define do
  Faker::Config.locale = 'pt-BR'
  email = Faker::Internet.email

  factory :municipe do
    name { Faker::Name.unique.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    cns { '705006671575253' }
    email { email }
    email_confirmation { email }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::PhoneNumber.cell_phone_in_e164.gsub(/[^\d]/, '') }
  end
end
