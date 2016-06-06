class CreateOrgCompanies < ActiveRecord::Migration
  def change
    create_table :org_companies do |t|

      t.timestamps null: false
    end
  end
end
