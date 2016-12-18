require 'active_model/version'

module Vault
	module Models
		module UserTrait
			extend ActiveSupport::Concern
			included do
			  # Relationship
			  has_and_belongs_to_many :roles, class_name: "Vault::Role", inverse_of: nil
			  has_and_belongs_to_many :sites, class_name: "Vault::Site", index: true, inverse_of: nil
			  has_and_belongs_to_many :permissions, class_name: "Vault::Permission", inverse_of: nil

			  # Add field
			  field :firstname,     type: String, default: ""
			  field :lastname,      type: String, default: ""   
			  field :gender,        type: String, default: ""
			  field :active,        type: Boolean, default: false
			  field :profile_img,   type: String, default: ""



	  		  field :current_site, type: BSON::ObjectId

			  # Scopes
			  scope :actived, -> { where(active: true) }

		      scope :site, ->(site_id){ where(:site_ids.in => [site_id]) }
			end

			# Mutator
			def fullname
			  p self.firstname + ' ' + self.lastname
			end

			def hasRole(string)
			  return self.roles.any? {|role| role.name == string}
			end

			def hasSite(string)
			  return (self.sites.where({name: string}).count == 1) ? true : false
			end

			def hasPermission(string)
			  return self.permissions.any? {|perm| perm.name == string}
			end
		end
	end
end