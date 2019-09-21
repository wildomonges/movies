# frozen_string_literal: true

class Api::V1::PeopleController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_person, only: %i[show update destroy]

  # GET /people
  def index
    people = search
    json_response serializer.new(people)
  end

  # POST /people
  def create
    person = Person.create!(person_params)
    json_response serializer.new(person), :created
  end

  # GET /people/:id
  def show
    json_response serializer.new(@person)
  end

  # PUT /people/:id
  def update
    @person.update_attributes!(person_params)
    json_response(message: 'updated')
  end

  # DELETE /people/:id
  def destroy
    @person.destroy!
    json_response(message: 'removed')
  end

  private

  def serializer
    PersonSerializer
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:last_name, :first_name, :gender)
  end

  def model
    Person
  end
end
