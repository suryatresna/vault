module Vault
  class UserController < ApplicationController

    def index
    	@users = User.all()
      render "user/index"
    end

    def new
    	@user = User.new
      global_perm
      render "user/new"
    end

    def create
      # render plain: user_params.inspect
    	@user = User.new(user_params)
      global_perm
      if @user.save
    	  redirect_to @user
      else
        render "user/new"
      end
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
      # render plain: params[:user][:password_confirmation].inspect
    	@user = User.find(params[:id])
      global_perm

    	if @user.update(user_params)
        if params[:user][:password_confirmation].present?
          if @user.update(user_pass_params)
            redirect_to(@user)
          else
            render 'user/edit'
          end
        else
          redirect_to(@user)
        end
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
  		params.require(:user).permit(:email,:active,:firstname, :lastname, permission_ids:[], role_ids:[], site_ids:[])
  	end

    def user_pass_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def global_perm
      @permissions = Permission.all()
      @sites = Site.all()
      @roles = Role.all()
    end

  end
end
