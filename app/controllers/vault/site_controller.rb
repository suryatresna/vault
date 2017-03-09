module Vault
  class SiteController < ApplicationController

    layout "admin/layouts/default"

    def index
    	@sites = Site.all()
      render "site/index"
    end

    def new
    	@site = Site.new
      global_params

      render "site/new"
    end

    def create
      # render plain: params.inspect
    	@site = Site.new(site_params)
      global_params
      if @site.save
    	  redirect_to @site
      else
        render 'site/new'
      end
      # render plain: @site.inspect
    	
    end

    def edit
    	@site = Site.find(params[:id])
      global_params
      @users = @site.users
      # render plain: @users.inspect
      render "site/edit"
    end

    def show
    	@site = Site.find(params[:id])
      global_params
      @users = @site.users
      render "site/show"
    end

    def update
    	@site = Site.find(params[:id])
    	if @site.update(site_params)
    		redirect_to(@site)
    	else
    		render 'site/edit'
    	end
    end

    def destroy
    	@site = Site.find(params[:id])
    	@site.destroy

    	redirect_to 'site'
    end 

    def upload
      
    end

    private
  	def site_params
  		params.require(:site).permit(:name, :label, :domain, :ga_code, :ga_view_id,permission_ids:[])
  	end

    def global_params
      @permissions = Permission.all()
      @users = User.all()
    end
  end
end
