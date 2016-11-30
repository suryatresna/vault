module Vault
  class SiteController < ApplicationController
    def index
    	@sites = Site.all()
      render "site/index"
    end

    def new
    	@site = Site.new
      @permissions = Permission.all()

      render "site/new"
    end

    def create
      # render plain: site_params.inspect
    	@site = Site.new(site_params)

    	@site.save
    	redirect_to @site
    end

    def edit
    	@site = Site.find(params[:id])
      @permissions = Permission.all()

      render "site/edit"
    end

    def show
    	@site = Site.find(params[:id])
      @permissions = Permission.all()
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

    private
  	def site_params
  		params.require(:site).permit(:name, :label, :domain, permissions:[])
  	end
  end
end
