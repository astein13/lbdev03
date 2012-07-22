class AddCreatorIdToFlier < ActiveRecord::Migration
  def self.up
    add_column :fliers, :creator_id, :string
  end

  def self.down
    remove_column :fliers, :creator_id, :string
  end
end
