class OrgPeopleController < ApplicationController

	def edit
		# All the setup that is needed to build the edit page view
		@person = OrgPerson.find(params[:id])
		@contactInfo = OrgContact.find_or_initialize_by(org_person_id: params[:id])
		@contactInfo[:email] = current_org_person.email
		@person.org_contacts.build(@contactInfo.attributes)
	end

	def update

	end

	private 
		def update_person_params
			params.require(:org_person).permit(org_contacts_attributes: [:address1, :address2,
        	:city, {typ_countries: :id}, {typ_regions: :id}, {org_company: :id}, :postal_code, :email, 
        	:business_number, :cell_number, :org_person_id, :avatar])
		end
end
