require 'dry/validation/compat/form'
require "reform"
require "reform/form/dry"

module User::Contract
  class Create < Reform::Form
    include Dry

    property :first_name
    property :last_name
    property :email

    validation do
      required(:email)
    end
  end
end
