# frozen_string_literal: true

class MovieSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel

  attributes :title

  attribute :release_year, &:release_year_in_roman
end
