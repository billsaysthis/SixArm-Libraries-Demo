class AddSalaryToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :salary, :integer
  end

  def self.down
    remove_column :people, :salary
  end
end
