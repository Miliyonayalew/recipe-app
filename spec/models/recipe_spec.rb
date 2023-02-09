require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    User.create(name: 'Miliyon', email: 'miliayalew@gmail.com', password: '123456')
  end

  before(:each) do
    @recipe = Recipe.new(name: 'Burger', description: 'A delicious burger', preparation_time: 10, cooking_time: 20,
                         user_id: subject.id)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@recipe).to be_valid
    end

    it 'Recipe should have a name' do
      expect(@recipe.name).to be_present
    end

    it 'Recipe should have a description' do
      expect(@recipe.description).to be_present
    end

    it 'Recipe should have a preparation time' do
      expect(@recipe.preparation_time).to be_present
    end

    it 'Recipe should have a valid preparation time' do
      expect(@recipe.preparation_time).to be >= 0
    end

    it 'Recipe preparation time should be numeric' do
      expect(@recipe.preparation_time).to be_a_kind_of(Numeric)
    end

    it 'Recipe should have a cooking time' do
      expect(@recipe.cooking_time).to be_present
    end

    it 'Recipe cooking time should be numeric' do
      expect(@recipe.preparation_time).to be_a_kind_of(Numeric)
    end

    it 'Recipe should have a valid cooking time' do
      expect(@recipe.cooking_time).to be >= 0
    end

    it 'Recipe should have a user id' do
      expect(@recipe.user_id).to be_present
    end
  end
end
