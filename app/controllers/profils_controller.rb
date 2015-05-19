class ProfilsController < ApplicationController
  before_action :set_profil, only: [:show, :edit, :update, :destroy]

  # GET /profils
  # GET /profils.json
  def index
    if params[:job].blank?
      @profils = Profil.all
    else
      @job_id=Job.find_by(name: params[:job]).id
      @profils = Profil.where(job_id: @job_id)
    end

  end

  def search
    @profils = Profil.all
    @profils = @profils.where(ville: params["locality"]) if params["locality"].present?
    @profils = @profils.where(ville: params["ville"]) if params["ville"].present?

    @profils = @profils.where(sexe: params["sexe"]) if params["sexe"].present?
    @profils = @profils.where(codePostal: params["postal_code"]) if params["postal_code"].present?
    @profils = @profils.where(codePostal: params["codePostal"]) if params["codePostal"].present?


    @reviews = Review.all

    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def search_post
    redirect_to "/search/#{params[:ville]}"
  end

  def search_postCP
    redirect_to "/search/#{params[:codePostal]}"
  end

  # GET /profils/1
  # GET /profils/1.json
  def show
    @reviews = Review.where(profil_id: @profil.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

 def find_profil
    @profils = Profil.type(params[:type].to_s.singularize).where(:reference => params[:id]).first if params[:id]
  end

  # GET /profils/new
  def new
    @profil = Profil.new
  end

  # GET /profils/1/edit
  def edit
  end

  # POST /profils
  # POST /profils.json
  def create
    @profil = Profil.new(profil_params)

    respond_to do |format|
      if @profil.save
        format.html { redirect_to @profil, notice: 'Profil was successfully created.' }
        format.json { render :show, status: :created, location: @profil }
      else
        format.html { render :new }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profils/1
  # PATCH/PUT /profils/1.json
  def update
    respond_to do |format|
      if @profil.update(profil_params)
        format.html { redirect_to @profil, notice: 'Profil was successfully updated.' }
        format.json { render :show, status: :ok, location: @profil }
      else
        format.html { render :edit }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profils/1
  # DELETE /profils/1.json
  def destroy
    @profil.destroy
    respond_to do |format|
      format.html { redirect_to profils_url, notice: 'Profil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profil
      @profil = Profil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profil_params
      params.require(:profil).permit(:prenom, :sexe, :job_id, :age, :phone, :address, :website, :codePostal, :ville, :image)
    end
end
