class ProyectsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: 'XAHTJEAS23123%23'
  before_action :set_proyect, only: [:show, :edit, :update, :destroy]

  # GET /proyects
  # GET /proyects.json
  def dashboard
    if params[:search]
      @proyect= Proyect.where(estado: params[:search])
    else
      @proyects = Proyect.all
    end
  end

  # GET /proyects/1
  # GET /proyects/1.json
  def show
  end

  # GET /proyects/new
  def new
    @proyect = Proyect.new
  end

  # GET /proyects/1/edit
  def edit
  end

  # POST /proyects
  # POST /proyects.json
  def create
    @proyect = Proyect.new(proyect_params)

    respond_to do |format|
      if @proyect.save
        format.html { redirect_to @proyect, notice: 'Proyect was successfully created.' }
        format.json { render :show, status: :created, location: @proyect }
      else
        format.html { render :new }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyects/1
  # PATCH/PUT /proyects/1.json
  def update
    respond_to do |format|
      if @proyect.update(proyect_params)
        format.html { redirect_to @proyect, notice: 'Proyect was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyect }
      else
        format.html { render :edit }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyects/1
  # DELETE /proyects/1.json
  def destroy
    @proyect.destroy
    respond_to do |format|
      format.html { redirect_to proyects_url, notice: 'Proyect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyect_params
      params.require(:proyect).permit(:nombre, :desc, :fecha_inicio, :fecha_termino, :estado)
    end
end
