module Vault
  class UserController < ApplicationController

    def index
    	@users = User.all()
      render "user/index"
    end

    def new
    	@user = User.new

      render "user/new"
    end

    def create
      # render plain: user_params.inspect
    	@user = User.new(user_params)

    	@user.save
    	redirect_to @user
    end

    def edit
    	@user = User.find(params[:id])
      global_perm
      render "user/edit"
    end

    def show
    	@user = User.find(params[:id])
      render "user/show"
    end

    def update
      # render plain: user_params.inspect
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    		redirect_to(@user)
    	else
    		render 'user/edit'
    	end
    end

    def destroy
    	@user = User.find(params[:id])
    	@user.destroy

    	redirect_to 'user'
    end 

    private
  	def user_params
  		params.require(:user).permit(:email, :encrypted_password, :active, :firstname, :lastname, permissions:[], roles:[])
  	end

    def global_perm
      @permissions = Permission.all()
      @sites = Site.all()
      @roles = Role.all()
    end

  end
end
