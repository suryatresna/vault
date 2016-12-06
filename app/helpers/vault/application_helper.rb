module Vault
  module ApplicationHelper
  	ActiveSupport.on_load(:action_view) do 
	  include ReactOnRailsHelper 
	end
  end
end
