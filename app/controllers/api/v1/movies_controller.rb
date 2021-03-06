# frozen_string_literal: true

class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_movie, only: %i[show update destroy]

  # GET /movies
  def index
    movies = search
    json_response serializer.new(movies)
  end

  # POST /movies
  def create
    result = CreateMovie.call(params: movie_params)
    raise ActiveRecord::RecordInvalid unless result.success?

    json_response serializer.new(result.movie), :created
  end

  # GET /movies/:id
  def show
    json_response serializer.new(@movie)
  end

  # PUT /movies/:id
  def update
    @movie.update_attributes!(movie_params)
    json_response(message: 'updated')
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy!
    json_response(message: 'removed')
  end

  private

  def serializer
    MovieSerializer
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_year, people_roles: %i[person_id role])
  end

  def model
    Movie
  end
end
