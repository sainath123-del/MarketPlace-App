require 'rails_helper'

RSpec.describe User, type: :model do
subject(:user){
  described_class.new (
    email: 'ajay@gmail.com',
    password: 'password',
    username: 'ajay'
  )
}
 
it 'is valid with valid attributes'do
expect(user).to be_valid
end 
describe 'validaton' do
  it 'should be invalid without username' do 
    user.username = nil 
    expect(user).to_not be_valid
  end 
  it 'should be invalid without email'
  it 'should be invalid without password'
  it 'should be invalid with a password shorter than 7 characters'
  it 'should be invalid with an email in the wrong format'
  it 'should check that emails are unique'
  it 'should check that username is unique'
 
end


end
