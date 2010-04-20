class AddFaveColorToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :favorite_color, :text
    ppl = Person.all
    ppl.each do |p|
      p.favorite_color = Colorful.choice
      p.save!
    end
  end

  def self.down
    remove_column :people, :favorite_color
  end
end
