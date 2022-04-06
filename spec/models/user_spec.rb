# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  %i[name username email password_digest].each do |field|
    it { is_expected.to(have_field(field).of_type(String)) }
  end

  describe 'Validations' do
    context 'with empty fields' do
      it 'tries to create an user without name' do
        expect {
          create(:user, name: nil)
        }.to(raise_error(Mongoid::Errors::Validations))
      end

      it 'tries to create an user without username' do
        expect {
          create(:user, username: nil)
        }.to(raise_error(Mongoid::Errors::Validations))
      end

      it 'tries to create an user without email' do
        expect {
          create(:user, email: nil)
        }.to(raise_error(Mongoid::Errors::Validations))
      end

      it 'tries to create an user without password' do
        expect {
          create(:user, password: nil)
        }.to(raise_error(Mongoid::Errors::Validations))
      end
    end

    context 'with all fields filled' do
      let(:user) { create(:user) }

      it 'tries to create with all fields' do
        expect(user.valid?).to(be_truthy)
      end
    end
  end
end
