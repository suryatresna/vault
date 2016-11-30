module Vault
	class Permission
	  include Mongoid::Document

	  store_in collection: "permissions"

	  field :name, type: String, default: ""
	  field :label, type: String, default: ""
	  field :system, type: Boolean, default: false	

	  validates :name, presence: {message: 'The name permission is required.'}, uniqueness: true
	  validates :label, presence: {message: 'The label permission is required.'}, uniqueness: true
	end
end
