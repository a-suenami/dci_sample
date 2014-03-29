class SomeModelEditingContext
  def initialize(some_model)
    unless some_model.persisted?
      raise UnavailableEditingError.new
    end
    @some_model = some_model.extend(SomeModel::EditingFormRole)
  end

  def receive_params_and_edit(params)
    @some_model.receive_params(params)
    @some_model.edit
  end
end

class UnavailableEditingError < StandardError
end
