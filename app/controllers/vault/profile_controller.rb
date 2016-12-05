module Vault
  class ProfileController < ApplicationController

    def show
      # # user_session()['current_site'] = 'gojek'
      # render plain: user_session().inspect
    	@user = current_user()
      render "profile/show"
    end

    def update

    end

    def update_one(field, value)

    end
  end
end
