require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    User.create(name: 'Miliyon', email: 'miliayalew@gmail.com', password: '123456')
  end

  before(:each) do
    @food = Food.new(name: 'Burger', measurement_unit: 'gram', price: 230, quantity: 4, user_id: subject.id)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@food).to be_valid
    end

    it 'Food should have a name' do
      expect(@food.name).to be_present
    end

    it 'Food should have a measurement unit' do
      expect(@food.measurement_unit).to be_present
    end

    it 'Food should have a price' do
      expect(@food.price).to be_present
    end

    it 'Food should have a valid price' do
      expect(@food.price).to be >= 0
    end

    it 'Food price should be numeric' do
      expect(@food.price).to be_a_kind_of(Numeric)
    end

    it 'Food should have a quantity' do
      expect(@food.quantity).to be_present
    end

    it 'Food quantity should be numeric' do
      expect(@food.quantity).to be_a_kind_of(Numeric)
    end

    it 'Food should have a valid quantity' do
      expect(@food.quantity).to be >= 0
    end

    it 'Food should have a user id' do
      expect(@food.user_id).to be_present
    end
  end

end
