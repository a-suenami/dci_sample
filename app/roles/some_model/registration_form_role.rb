class SomeModel < ActiveRecord::Base
  module RegistrationFormRole
    def receive_params(params)
      self.attributes = params
    end

    def register
      save
    end
  end
end
