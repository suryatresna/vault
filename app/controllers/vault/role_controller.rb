module Vault
  class RoleController < ApplicationController
    def index
    	@roles = Role.all()
      render "role/index"
    end

    def new
    	@role = Role.new
      global_params
      render "role/new"
    end

    def create
      # render plain: role_params.inspect
    	@role = Role.new(role_params)
      global_params
    	if @role.save
    	  redirect_to @role
      else
        render "role/new"
      end
    end

    def edit
    	@role = Role.find(params[:id])
      global_params
      render "role/edit"
    end

    def show
    	@role = Role.find(params[:id])
      global_params
      render "role/show"
    end

    def update

    	@role = Role.find(params[:id])
      global_params
    	if @role.update(role_params)
    		redirect_to(@role)
    	else
    		render 'role/edit'
    	end
    end

    def destroy
    	@role = Role.find(params[:id])
    	@role.destroy

    	redirect_to 'role'
    end 

    private
  	def role_params
  		params.require(:role).permit(:name, :label, permission_ids:[])
  	end
    def global_params
      @permissions = Permission.all()
    end
  end
end
