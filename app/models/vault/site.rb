module Vault
	class Site
	  include Mongoid::Document

	  store_in collection: "sites"

	  field :name, type: String, default: ""
	  field :label, type: String, default: ""
	  field :domain, type: String, default: ""
	  field :permissions, type: Array, default: []	

	  validates :name, presence: {message: 'The name site is required.'}, uniqueness: true
	  validates :label, presence: {message: 'The label site is required.'}, uniqueness: true
	  validates :domain, presence: {message: 'The domain site is required.'}, uniqueness: true
	  validates :permissions, presence: {message: 'The permission site is required.'}, presence: true
	end
end
