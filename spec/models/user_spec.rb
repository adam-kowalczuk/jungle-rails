# rubocop:disable Metrics/BlockLength
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
    it 'should save if all fields meet validations' do
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
      it 'should not save when password and password_confirmation do not match' do
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
  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(
        email: 'a@a.com',
        first_name: 'ABC',
        last_name: 'DEF',
        password: '1234',
        password_confirmation: '1234'
      )
    end
    it 'should authenticate if @user equals @auth_user' do
      @auth_user = User.authenticate_with_credentials('a@a.com', '1234')
      expect(@auth_user).to eql(@user)
    end
    it 'should authenticate if email has trailing spacing in email input' do
      @auth_user = User.authenticate_with_credentials(' a@a.com ', '1234')
      expect(@auth_user).to eql(@user)
    end
    it 'should authenticate if email is capitalized' do
      @auth_user = User.authenticate_with_credentials(' A@A.com ', '1234')
      expect(@auth_user).to eql(@user)
    end
    it 'should not authenticate if email and password are incorrect' do
      @auth_user = User.authenticate_with_credentials('b@b.com ', '1235')
      expect(@auth_user).to_not eql(@user)
    end
  end
end

# rubocop:enable Metrics/BlockLength
