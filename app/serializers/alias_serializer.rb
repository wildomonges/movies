# frozen_string_literal: true

class AliasSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
end
