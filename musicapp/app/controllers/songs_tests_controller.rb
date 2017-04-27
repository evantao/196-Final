class SongsTestsController < ApplicationController
  before_action :set_songs_test, only: [:show, :edit, :update, :destroy]

  # GET /songs_tests
  # GET /songs_tests.json
  def index
    @songs_tests = SongsTest.all
  end

  # GET /songs_tests/1
  # GET /songs_tests/1.json
  def show
  end

  # GET /songs_tests/new
  def new
    @songs_test = SongsTest.new
  end

  # GET /songs_tests/1/edit
  def edit
  end

  # POST /songs_tests
  # POST /songs_tests.json
  def create
    @songs_test = SongsTest.new(songs_test_params)

    respond_to do |format|
      if @songs_test.save
        format.html { redirect_to @songs_test, notice: 'Songs test was successfully created.' }
        format.json { render :show, status: :created, location: @songs_test }
      else
        format.html { render :new }
        format.json { render json: @songs_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs_tests/1
  # PATCH/PUT /songs_tests/1.json
  def update
    respond_to do |format|
      if @songs_test.update(songs_test_params)
        format.html { redirect_to @songs_test, notice: 'Songs test was successfully updated.' }
        format.json { render :show, status: :ok, location: @songs_test }
      else
        format.html { render :edit }
        format.json { render json: @songs_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs_tests/1
  # DELETE /songs_tests/1.json
  def destroy
    @songs_test.destroy
    respond_to do |format|
      format.html { redirect_to songs_tests_url, notice: 'Songs test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songs_test
      @songs_test = SongsTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def songs_test_params
      params.require(:songs_test).permit(:song_id, :test_id)
    end
end
