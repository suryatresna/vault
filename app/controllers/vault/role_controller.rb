module Vault
  class RoleController < ApplicationController
    def index
    	@roles = Role.all()
      render "role/index"
    end

    def new
    	@role = Role.new
      render "role/new"
    end

    def create
      # render plain: role_params.inspect
    	@role = Role.new(role_params)

    	@role.save
    	redirect_to @role
    end

    def edit
    	@role = Role.find(params[:id])

      render "role/edit"
    end

    def show
    	@role = Role.find(params[:id])

      render "role/show"
    end

    def update
    	@role = Role.find(params[:id])
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
  		params.require(:role).permit(:name, :label)
  	end
  end
end
