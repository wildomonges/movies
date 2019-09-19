# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a valid movie factory' do
    expect(build(:movie)).to be_valid
  end

  describe 'Associations' do
    Role.roles.each do |role|
      base = "#{role}_movie_person_roles".to_sym
      it { should have_many base }
      it { should have_many(role.to_s.pluralize.to_sym).through(base) }
    end
  end

  describe 'validation - ' do
    context 'required attributes -' do
      it { should validate_presence_of :title }
      it { should validate_presence_of :release_year }

      it { should validate_length_of(:title).is_at_least(1).is_at_most(50) }
      it { should validate_numericality_of(:release_year).is_greater_than_or_equal_to(1800).is_less_than_or_equal_to(2020)}
    end
  end

  describe 'movie -' do
    context ' is not valid - ' do
      let(:movie) { build(:movie) }

      it 'without title' do
        movie.title = nil
        expect(movie).to_not be_valid
      end
      it 'without release year' do
        movie.release_year = nil
        expect(movie).to_not be_valid
      end
    end
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      let(:movie) { build(:movie) }
      it { expect(movie).to respond_to(:release_year_in_roman) }
    end
  end
end
