module CompaniesHelper
  def fav_colors_list(c)
    fc = []
    c.people.count(:group => :favorite_color).each_pair do |k,v|
      fc << k + ': ' + v.to_s
    end
    fc.to_sentence
  end
end
