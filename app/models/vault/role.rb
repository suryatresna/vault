module Vault
	class Role
	  include Mongoid::Document

	  # Relationship
	  # has_and_belongs_to_many :user
	  has_and_belongs_to_many :permissions, class_name: "Vault::Permission"

	  store_in collection: "roles"

	  field :name, type: String, default: ""
	  field :label, type: String, default: ""
	  field :permission_ids, type: Array, default: []	

	  validates :name, presence: {message: 'The name role is required.'}, uniqueness: true
	  validates :label, presence: {message: 'The label role is required.'}, uniqueness: true
	  validates :permission_ids, presence: {message: 'The permission for this role is required.'}, presence: true

	  def users
	  	User.where({:role_ids.in => [self._id]})
	  end	
	end
end
