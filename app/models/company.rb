require 'csv'

class Company < ActiveRecord::Base
  has_many :departments
  has_many :people
  
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 8 }
  validates :city, :presence => true
  validates :state, :presence => true, :length => { :in => 2..2 }
  validates :incorporation_year, :presence => true
  
  def to_s
    self.name
  end
  
  def from_csv(csvfile)
    cur = 0
    CSV.open(csvfile, 'r') do |row|
      if cur > 0 # skip first row, has col names
      else
        cols = row
      end
    end
  end
  
  def to_csv
    cur_csv = 'tmp/' + self.name + '-staff-export-' + Date.today.to_s + '.csv'
    begin
      expcnt = CSV.generate do |csv|
        csv << ['name', 'department', 'title', 'salary', 'phone', 'favorite color','hired', 'terminated']
        self.people.each do |p|
          csv << [p.list_name, p.department.name, p.title, p.salary, p.phone, p.favorite_color, p.hired_on.to_s, p.terminated_on.to_s]
        end
        send_data(expcnt, :type=> 'text/csv; charset=utf-8; header=present', :filename => cur_csv)
      end
      return {:res => 'success', :msg => 'Wrote export file: ' + cur_csv}
    rescue Exception => exc
      return {:res => 'error', :msg => 'Problem: Could not write export file, ' + exc.message}
    end
  end
end
