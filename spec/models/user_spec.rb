require 'rails_helper'

RSpec.describe User, type: :model do
    before :example do
    @user = User.create!({
      first_name:  'John',
      last_name: 'Doe',
      email: 'example@example.com',
      password: 'secrets',
      password_confirmation: 'secrets'
    })
  end

  after :example do
    @user.destroy!
  end

  describe 'Validations' do
    it 'is valid' do
      expect(@user).to be_valid
    end 

    it 'is not valid without password field' do
      @user.password = nil
      expect(@user).to_not be_valid;
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'is not valid without a password confirmation field' do
    end

    it 'is not valid if the password is shorter than 6 characters' do
      @user.password = 'hi'
      expect(@user).to_not be_valid;
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'has matching password and password_confirmation fields' do
      @user.password = 'hellow'
      @user.password_confirmation = 'hiyadoo'
      expect(@user).to_not be_valid;
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid;
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'has a unique email (not case-sensitive)' do
      @user2 = User.create({
        first_name:  'John',
        last_name: 'Doe',
        email: 'EXAMPLE@example.com',
        password: 'secrets',
        password_confirmation: 'secrets'
      })
      expect(@user2).not_to be_valid;
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it 'is not valid without a first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid;
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'is not valid without a last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid;
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

  end

  describe '.authenticate_with_credentials' do
    it 'is valid' do
      user_login = User.authenticate_with_credentials(@user.email, 'secrets')
      expect(user_login).to_not be_nil
    end

    it 'is not valid without an email' do
      user_login = User.authenticate_with_credentials( '' , 'secrets')
      expect(user_login).to be_nil
    end

    it 'is not valid without a password' do
      user_login = User.authenticate_with_credentials( @user.email , nil )
      expect(user_login).to be_nil
    end

    it 'is not valid if there is no email in the database' do
      user_login = User.authenticate_with_credentials( 'yellow@hi.com' , 'jaundice' )
      expect(user_login).to be_nil
    end

    it 'is not valid if the password does not match' do
      user_login = User.authenticate_with_credentials( @user.email , 'jaundice' )
      expect(user_login).to be_nil
    end

    it 'is valid with extra white space' do
      user_login = User.authenticate_with_credentials( '   example@example.com  ' , 'secrets' )
      expect(user_login).to_not be_nil
    end

    it 'is valid with wrong email case' do
      user_login = User.authenticate_with_credentials( 'EXAMPLE@example.com' , 'secrets' )
      expect(user_login).to_not be_nil
    end

  end

end
