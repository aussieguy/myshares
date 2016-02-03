class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]

  # GET /shares
  # GET /shares.json
  def index
    @shares = Share.all
  end

  # GET /shares/1
  # GET /shares/1.json
  def show
#    require 'net/https'   #load Net::HTTP   For documentation, see: http://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html
#require 'httparty'
uri = URI('http://www.visionaustralia.org')
res = Net::HTTP.get_response(uri)
#x = Net::HTTP.get('http://www.visionaustralia.org')
#puts res.code
#puts res.message
#puts res.body
response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
puts response.body, response.code, response.message, response.headers.inspect

#uri = URI.parse("http://au.finance.yahoo.com/d/quotes.csv?s=TLS.AX&f=snd1l")
#response = HTTParty.get('http://au.finance.yahoo.com/d/quotes.csv?s=TLS.AX&f=snd1l')
#puts response.body, response.code, response.message, response.headers.inspect

  end

  # GET /shares/new
  def new
    @share = Share.new
  end

  # GET /shares/1/edit
  def edit
  end

  # POST /shares
  # POST /shares.json
  def create
    @share = Share.new(share_params)

    respond_to do |format|
      if @share.save
        format.html { redirect_to @share, notice: 'Share was successfully created.' }
        format.json { render :show, status: :created, location: @share }
      else
        format.html { render :new }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shares/1
  # PATCH/PUT /shares/1.json
  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
        format.json { render :show, status: :ok, location: @share }
      else
        format.html { render :edit }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url, notice: 'Share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_params
      params.require(:share).permit(:code, :company, :exchange)
    end
end
