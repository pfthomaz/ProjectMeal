class OrgCompaniesController < ApplicationController
	before_action :signed_in_user, only: [:new]
	
	def new
		signed_in_user #Be sure the user is signed in before he can create a company
		@company = OrgCompany.new # Make new company object 
		@contactInfo = OrgContact.new.attributes  # Make new contact object w/ empty attributes
		@company.org_contacts.build(@contactInfo)
	end

	private
		def signed_in_user
			unless signed_in?
				store_location
				redirect_to signin_url, flash: {warning: "Please sign in."}			
		end
end
