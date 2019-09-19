class PersonSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel
  
  attributes :id, :last_name, :first_name, :gender
end
