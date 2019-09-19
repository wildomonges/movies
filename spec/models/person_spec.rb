# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'has a valid male person factory' do
    expect(build(:male_person)).to be_valid
  end
  it 'has a valid female factory' do
    expect(build(:female_person)).to be_valid
  end

  describe 'Associations' do
    it { should have_many :movie_person_roles }
    it { should have_many :movies }
    it { should have_many :aliases }
  end

  describe 'validation - ' do
    context 'required attributes -' do
      it { should validate_presence_of :last_name }
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :gender }

      it { should validate_length_of(:last_name).is_at_least(3).is_at_most(50) }
      it { should validate_length_of(:first_name).is_at_least(3).is_at_most(50) }
    end
  end

  describe 'person -' do
    context ' is not valid - ' do
      let(:person) { build(:male_person) }

      it 'without last_name' do
        person.last_name = nil
        expect(person).to_not be_valid
      end
      it 'without first_name' do
        person.first_name = nil
        expect(person).to_not be_valid
      end
      it 'without gender' do
        person.gender = nil
        expect(person).to_not be_valid
      end
    end
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      let(:person) { build(:male_person) }
      Role.roles.each do |role|
        it { expect(person).to respond_to("movies_as_#{role}") }
      end
    end
  end
end
