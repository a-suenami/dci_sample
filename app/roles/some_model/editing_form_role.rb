class SomeModel < ActiveRecord::Base
  module EditingFormRole
    def receive_params(params)
      self.attributes = params
    end

    def edit
      save
    end
  end
end
