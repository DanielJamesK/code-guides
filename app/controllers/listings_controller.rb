class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:buy]
  before_action :authenticate_user!, except: [:buy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :buy]
  before_action :check_user, only: [:edit, :update, :destroy]
  
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
    @personal_listings = current_user.listings
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listings = Listing.find_by_programming_language_id(params[:id])
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @user_name = current_user.first_name
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy
    Stripe.api_key = ENV['STRIPE_API_KEY']
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: success_url(params[:id]),
      cancel_url: cancel_url(params[:id]),
      line_items: [
        {
          price_data: {
            currency: 'aud',
            product_data: {
              name: @listing.tutor_name
            },
            unit_amount: (@listing.price.to_f * 100).to_i
          },
          quantity: 1
        }
      ]
    })

    render json: session
  end

  def success
  end

  def cancel
  end

  private

    # Checks to see if the user is the owner or the listing, or and admin, otherwise access is denied
    def check_user
      if user_signed_in? && (current_user.has_role?(:admin) || current_user.id == @listing.user_id )
      else 
      flash[:alert] = "You are not authorized to do that!"
      redirect_to root_path
      end
    end
   
    # Sets the listing
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:tutor_name, :tutor_email, :title, :description, :price, :user_id, :programming_language_id, :picture)
    end
end
