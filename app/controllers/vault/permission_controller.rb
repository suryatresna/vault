module Vault
  class PermissionController < ApplicationController
    def index
    	@permissions = Permission.all()
      render "permission/index"
    end

    def new
    	@permission = Permission.new
      render "permission/new"
    end

    def create
      # render plain: permission_params.inspect
    	@permission = Permission.new(permission_params)

    	@permission.save
    	redirect_to @permission
    end

    def edit
    	@permission = Permission.find(params[:id])

      render "permission/edit"
    end

    def show
    	@permission = Permission.find(params[:id])

      render "permission/show"
    end

    def update
    	@permission = Permission.find(params[:id])
    	if @permission.update(permission_params)
    		redirect_to(@permission)
    	else
    		render 'permission/edit'
    	end
    end

    def destroy
    	@permission = Permission.find(params[:id])
    	@permission.destroy

    	redirect_to 'permission'
    end 

    private
  	def permission_params
  		params.require(:permission).permit(:name, :label, :system)
  	end
  end
end
