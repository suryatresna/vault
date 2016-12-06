module Vault
	class Site
	  include Mongoid::Document

	  # has_and_belongs_to_many :users, class_name: "User"
	  has_and_belongs_to_many :permissions, class_name: "Vault::Permission"

	  store_in collection: "sites"

	  field :name, type: String, default: ""
	  field :label, type: String, default: ""
	  field :domain, type: String, default: ""
	  field :description, type: String, default: ""
	  
	  field :active, type: Boolean, default: false

	  # set icons site [favicon, icon, footer_icon, side_icon]
	  field :icons, type: Array, default: []
	  field :howto, type: Array, default: []

	  field :permission_ids, type: Array, default: []

	  # Google Analytic Code
	  field :ga_code, type: String, default: ""


	  validates :name, presence: {message: 'The name site is required.'}, uniqueness: true
	  validates :label, presence: {message: 'The label site is required.'}, uniqueness: true
	  validates :domain, presence: {message: 'The domain site is required.'}
	  validates :permission_ids, presence: {message: 'The permissions site allowed is required.'}, presence: true


	  # Accentors n Mutators
	  def users
	  	User.site(self.id)
	  end

	  def icon(string)
	  	p icon[string].present? ? icon[string] : nil
	  end	

	  ## Indexing
	  index({ name: 1 }, { unique: true, name: "site_key" }) 
	end
end
