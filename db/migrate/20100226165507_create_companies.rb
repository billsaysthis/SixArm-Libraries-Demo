class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :incorporation_year

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
