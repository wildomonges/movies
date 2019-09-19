# frozen_string_literal: true

class AliasSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel

  attributes :name
end
