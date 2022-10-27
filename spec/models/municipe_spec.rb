require 'rails_helper'

RSpec.describe Municipe, type: :model do
  context 'associations' do
    specify { is_expected.to have_one_attached(:avatar) }
    specify { is_expected.to have_one(:endereco).inverse_of(:municipe) }
  end

  describe '#name' do
    specify { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:name) }
  end

  describe '#cpf' do
    specify { is_expected.to have_db_column(:cpf).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cpf) }
    specify { is_expected.to require_a_valid_cpf(:cpf) }
  end

  describe '#cns' do
    specify { is_expected.to have_db_column(:cns).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cns) }

    context 'when the cns value is less than 15' do
      it 'record is not valid and adds invalid_cns error to cns attribute' do
        municipe = build(:municipe, cns: '123')

        expect(municipe.valid?).to be_falsey
        expect(municipe.errors[:cns]).not_to be_empty
      end
    end

    context 'when the cns value is greater than 15' do
      it 'record is not valid and adds invalid_cns error to cns attribute' do
        municipe = build(:municipe, cns: Faker::Number.number(digits: 16))

        expect(municipe.valid?).to be_falsey
        expect(municipe.errors[:cns]).not_to be_empty
      end
    end

    context 'when the cns value is valid staterd with 7' do
      it 'record valid and not adds invalid_cns error to cns attribute' do
        municipe = build(:municipe, cns: '705006671575253')

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:cns]).to be_empty
      end
    end

    context 'when the cns value is valid staterd with 8' do
      it 'record valid and not adds invalid_cns error to cns attribute' do
        municipe = build(:municipe, cns: '852210718520000')

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:cns]).to be_empty
      end
    end

    context 'when the cns value is valid staterd with 9' do
      it 'record valid and not adds invalid_cns error to cns attribute' do
        municipe = build(:municipe, cns: '972553637630001')

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:cns]).to be_empty
      end
    end

    context 'when the cns value is valid staterd with 1' do
      it 'record valid and not adds invalid_cns error to cns attribute' do
        municipe = build(:municipe, cns: '129662413810004')

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:cns]).to be_empty
      end
    end

    context 'when the cns value is valid staterd with 2' do
      it 'record valid and not adds invalid_cns error to cns attribute' do
        municipe = build(:municipe, cns: '263188470570005')

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:cns]).to be_empty
      end
    end
  end

  describe '#email' do
    specify { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:email) }
    specify { is_expected.to validate_confirmation_of(:email) }

    specify { is_expected.to validate_email_format_of(:email).with_message('email inválido') }
  end

  describe '#birth_date' do
    specify { is_expected.to have_db_column(:birth_date).of_type(:date).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:birth_date) }

    context 'when birth date is greater than the current day' do
      it 'record is not valid and adds greater_than_or_equal_to error to birth_date attribute' do
        municipe = build(:municipe, birth_date: Date.tomorrow)

        expect(municipe.valid?).to be_falsey
        expect(municipe.errors[:birth_date]).not_to be_empty
      end
    end

    context 'when birth date is equals to current day' do
      it 'record is valid and not adds greater_than_or_equal_to error to birth_date attribute' do
        municipe = build(:municipe, birth_date: Date.today)

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:birth_date]).to be_empty
      end
    end

    context 'when birth date is less than the current day' do
      it 'record is valid and not adds greater_than_or_equal_to error to birth_date attribute' do
        municipe = build(:municipe, birth_date: Date.yesterday)

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:birth_date]).to be_empty
      end
    end
  end

  describe '#phone' do
    specify { is_expected.to have_db_column(:phone).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:birth_date) }
  end
end
