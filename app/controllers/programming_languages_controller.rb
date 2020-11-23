class ProgrammingLanguagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_roles, only: [:new, :edit, :update, :destroy]
  before_action :set_programming_language, only: [:show, :edit, :update, :destroy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /programming_languages
  # GET /programming_languages.json
  def index
    @programming_languages = ProgrammingLanguage.all
  end

  # GET /programming_languages/1
  # GET /programming_languages/1.json
  def show
    @listings = Listing.where(programming_language_id: params[:id])
  end

  # GET /programming_languages/new
  def new
    @programming_language = ProgrammingLanguage.new
  end

  # GET /programming_languages/1/edit
  def edit
  end

  # POST /programming_languages
  # POST /programming_languages.json
  def create
    @programming_language = ProgrammingLanguage.new(programming_language_params)
    @programming_language.user_id = current_user.id
    respond_to do |format|
      if @programming_language.save
        format.html { redirect_to programming_languages_path, notice: 'Programming language was successfully created.' }
        format.json { render :show, status: :created, location: @programming_language }
      else
        format.html { render :new }
        format.json { render json: @programming_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programming_languages/1
  # PATCH/PUT /programming_languages/1.json
  def update
    respond_to do |format|
      if @programming_language.update(programming_language_params)
        format.html { redirect_to programming_languages_path, notice: 'Programming language was successfully updated.' }
        format.json { render :show, status: :ok, location: @programming_language }
      else
        format.html { render :edit }
        format.json { render json: @programming_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programming_languages/1
  # DELETE /programming_languages/1.json
  def destroy
    @programming_language.destroy
    respond_to do |format|
      format.html { redirect_to programming_languages_path, notice: 'Programming language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Checks the users role and if they are not an Admin access is denied
    def check_roles
      if !(user_signed_in? && current_user.has_role?(:admin))
        flash[:alert] = 'You are not authorized to access that page'
        redirect_to root_path
      end
    end
    
    # Set listing so it can be accessed in the programming language views
    def set_listing
      @listings = Listing.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_programming_language
      @programming_language = ProgrammingLanguage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def programming_language_params
      params.require(:programming_language).permit(:name, :description, :user_id, :picture)
    end
end
