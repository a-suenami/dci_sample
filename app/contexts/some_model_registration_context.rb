class SomeModelRegistrationContext
  def initialize(some_model)
    @some_model = some_model.extend(SomeModel::RegistrationFormRole)
  end

  def receive_params_and_register(params)
    @some_model.receive_params(params)
    @some_model.register
  end
end
