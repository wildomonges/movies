# frozen_string_literal: true

class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]

  # GET /movies
  def index
    movies = Movie.all
    json_response serializer.new(movies)
  end

  # POST /movies
  def create
    movie = Movie.create!(movie_params)
    json_response serializer.new(movie), :created
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
    params.permit(:title, :release_year)
  end
end
