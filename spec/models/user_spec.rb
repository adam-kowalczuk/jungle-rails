require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        email: 'a@a.com',
        first_name: 'ABC',
        last_name: 'DEF',
        password: '1234',
        password_confirmation: '1234'
      )
    end
    it 'should save is all fields meet validations' do
      expect(@user.save).to be true
    end
    context 'Password Validations' do
      it 'should not save when no password is provided' do
        @user.password = nil
        expect(@user.save).to_not be true
        expect(@user.errors.full_messages).to include('Password can\'t be blank')
      end
      it 'should not save when no password confirmation is provided' do
        @user.password_confirmation = nil
        expect(@user.save).to_not be true
        expect(@user.errors.full_messages).to include('Password confirmation can\'t be blank')
      end
      it 'should not save when no passwords do not match' do
        @user.password_confirmation = '123'
        expect(@user.save).to_not be true
        expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
      end
      it 'should not save when password is too short' do
        @user.password = '123'
        @user.password_confirmation = '123'
        expect(@user.save).to_not be true
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 4 characters)')
      end
    end
    context 'Email Validations' do
      it 'should not save if no email is provided' do
        @user.email = nil
        expect(@user.save).to_not be true
        expect(@user.errors.full_messages).to include('Email can\'t be blank')
      end
      it 'should not save if email already exists' do
        @user.save
        @user2 = User.new(
          email: 'A@A.com',
          first_name: 'ABC',
          last_name: 'DEF',
          password: '1234',
          password_confirmation: '1234'
        )
        expect(@user2.save).to_not be true
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
    end
    context 'Name Validations' do
      it 'should not save if no first_name is provided' do
        @user.first_name = nil
        expect(@user.save).to_not be true
        expect(@user.errors.full_messages).to include('First name can\'t be blank')
      end
      it 'should not save if no last_name is provided' do
        @user.last_name = nil
        expect(@user.save).to_not be true
        expect(@user.errors.full_messages).to include('Last name can\'t be blank')
      end
    end
  end
end
