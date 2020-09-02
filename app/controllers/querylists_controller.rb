class QuerylistsController < ApplicationController
  include HTTParty
  before_action :set_querylist, only: [:show, :edit, :update, :destroy]

  # GET /querylists
  # GET /querylists.json
  def index
    @querylists =  HTTParty.post("http://66.175.217.67:3020/argames/getQuery", :body => { :checkFilter => '' }, :headers => {"Authorization" => "Bearer " + ENV["API_KEY"] })
  end

  # GET /querylists/1
  # GET /querylists/1.json
  def show
  end

  # GET /querylists/new
  def new
    @querylist = Querylist.new
  end

  # GET /querylists/1/edit
  def edit
  end

  # POST /querylists
  # POST /querylists.json
  def create
    @querylist = Querylist.new(querylist_params)

    respond_to do |format|
      if @querylist.save
        format.html { redirect_to @querylist, notice: 'Querylist was successfully created.' }
        format.json { render :show, status: :created, location: @querylist }
      else
        format.html { render :new }
        format.json { render json: @querylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /querylists/1
  # PATCH/PUT /querylists/1.json
  def update
    respond_to do |format|
      if @querylist.update(querylist_params)
        format.html { redirect_to @querylist, notice: 'Querylist was successfully updated.' }
        format.json { render :show, status: :ok, location: @querylist }
      else
        format.html { render :edit }
        format.json { render json: @querylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /querylists/1
  # DELETE /querylists/1.json
  def destroy
    @querylist.destroy
    respond_to do |format|
      format.html { redirect_to querylists_url, notice: 'Querylist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_querylist
      @querylist = Querylist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def querylist_params
      params.require(:querylist).permit(:emailaddres, :query)
    end
end
