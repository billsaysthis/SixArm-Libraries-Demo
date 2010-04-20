class AddPlainFullnameToPerson < ActiveRecord::Migration
  include PersonName
  def self.up
    add_column :people, :plain_fullname, :text
    ppl = Person.all
    ppl.each do |p|
      p.plain_fullname = p.full_name.unaccent
      p.save!
    end
  end

  def self.down
    remove_column :people, :plain_fullname
  end
end
