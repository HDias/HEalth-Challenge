FactoryBot.define do
  factory :endereco do
    cep { Faker::Address.zip.gsub(/[^\d]/, '') }
    logradouro { Faker::Address.street_name }
    complemento { Faker::Address.secondary_address }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city  }
    uf { Faker::Address.state_abbr }
    ibge_code { Faker::Number.number(digits: 10).to_s }
  end
end
