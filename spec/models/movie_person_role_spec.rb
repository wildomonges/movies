# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviePersonRole, type: :model do
  it 'has a valid movie_person_role factory' do
    expect(build(:movie_person_role)).to be_valid
  end

  describe 'Associations' do
    it { should belong_to :movie }
    it { should belong_to :person }
  end

  describe 'validation - ' do
    context 'required attributes -' do
      it { should validate_presence_of :movie }
      it { should validate_presence_of :person }
      it { should validate_presence_of :role }
    end
  end

  describe 'movie_person_role -' do
    context ' is not valid - ' do
      let(:movie_person_role) { build(:movie_person_role) }

      it 'without movie' do
        movie_person_role.movie = nil
        expect(movie_person_role).to_not be_valid
      end
      it 'without person' do
        movie_person_role.person = nil
        expect(movie_person_role).to_not be_valid
      end
    end
  end
end
