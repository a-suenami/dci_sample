class SomeModelsController < ApplicationController
  before_action :set_some_model, only: [:show, :edit, :update, :destroy]

  # GET /some_models
  # GET /some_models.json
  def index
    @some_models = SomeModel.all
  end

  # GET /some_models/1
  # GET /some_models/1.json
  def show
  end

  # GET /some_models/new
  def new
    @some_model = SomeModel.new
  end

  # GET /some_models/1/edit
  def edit
  end

  # POST /some_models
  # POST /some_models.json
  def create
    @some_model = SomeModel.new

    context = SomeModelRegistrationContext.new(@some_model)

    respond_to do |format|
      if context.receive_params_and_register(some_model_params)
        format.html { redirect_to @some_model, notice: 'Some model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @some_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @some_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /some_models/1
  # PATCH/PUT /some_models/1.json
  def update
    context = SomeModelEditingContext.new(@some_model)

    respond_to do |format|
      if context.receive_params_and_edit(some_model_params)
        format.html { redirect_to @some_model, notice: 'Some model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @some_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /some_models/1
  # DELETE /some_models/1.json
  def destroy
    @some_model.destroy
    respond_to do |format|
      format.html { redirect_to some_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_some_model
      @some_model = SomeModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def some_model_params
      params.require(:some_model).permit(:name)
    end
end
