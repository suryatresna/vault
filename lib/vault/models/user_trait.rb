require 'active_model/version'

module Vault
	module Models
		module UserTrait
			extend ActiveSupport::Concern
			included do
			  # Relationship
			  has_and_belongs_to_many :roles, class_name: "Vault::Role"
			  has_and_belongs_to_many :sites, class_name: "Vault::Site", index: true
			  has_and_belongs_to_many :permissions, class_name: "Vault::Permission"

			  # Add field
			  field :firstname,     type: String, default: ""
			  field :lastname,      type: String, default: ""   
			  field :gender,        type: String, default: ""
			  field :active,        type: Boolean, default: false
			  field :profile_img,   type: String, default: ""
			end

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