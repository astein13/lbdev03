class CreateOrganizationFliers < ActiveRecord::Migration
  def change
    create_table :organization_fliers do |t|
      t.integer :organization_id
      t.integer :flier_id
      t.integer :attending_status

      t.timestamps
    end
  end
end
