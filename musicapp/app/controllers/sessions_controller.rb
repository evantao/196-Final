class SessionsController < ApplicationController

  # GET /sessions/login $
  def login 
    render :new
  end

# POST /sessions/login #
  def create
    @user = User.find_by_name(params[:name])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to users_url
    else
      respond_to do |format|
        format.html { redirect_to create_login_url, notice: 'Name or password incorrect.' } 
        format.json {head :no_content } 
      end
    end
  end

  def destroy
    destroy_name = current_user.name
    reset_session
    respond_to do |format|
      format.html { redirect_to users_url, notice: destroy_name + ' was successfully logged out.' }
      format.json { head :no_content }
    end
  end

end
