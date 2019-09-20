# frozen_string_literal: true

class CreateMovie
  include Interactor

  def call
    Movie.transaction do
      movie = Movie.new(movie_header_params)
      if movie.save
        people_roles_params.each do |person_role|
          save_movie_person_role(movie: movie, person_role: person_role)
        end
        context.movie = movie
      else
        context.fail!(message: 'movie not saved')
      end
    end
  end

  private

  def movie_header_params
    { title: context.params[:title], release_year: context.params[:release_year] }
  end

  def people_roles_params
    context.params[:people_roles]
  end

  def save_movie_person_role(movie:, person_role:)
    movie_person_role = MoviePersonRole.new(person_role)
    movie_person_role.movie = movie
    movie_person_role.save!
  end
end
