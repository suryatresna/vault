module Vault
	class Role
	  include Mongoid::Document

	  store_in collection: "roles"

	  field :name, type: String, default: ""
	  field :label, type: String, default: ""	

	  validates :name, presence: {message: 'The name role is required.'}, uniqueness: true
	  validates :label, presence: {message: 'The label role is required.'}, uniqueness: true
	end
end
