module PeopleHelper
  def people_list_title(opts={})
    c = opts[:company] ? opts[:company] + ' ' : ''
    c += opts[:department] ? opts[:department]  + ' ' : ''
    c
  end
  
  # easy stringified version of salary
  # TODO add pretty print output function
  def salary_str(p)
    s = '$' + (p.salary/1000).to_s + 'k'
  end

  # easy stringified version of hired_on
  def hired(p, sizing)
    p.hired_on.nil? ? '' : p.hired_on.to_date.to_formatted_s(sizing.to_sym)
  end
  
  def phone_as_extension(p)
    pe = p.phone.length-4
    'x' + p.phone[pe,4]
  end
  
  def short_line_person(person)
		r = "<span class='actions'>" + link_to('E', edit_person_path(person), :title => 'Edit')
		if deletable
			r += link_to 'X', terminate_person_path(person), :confirm => 'Terminate this staffer?', :title => 'Terminate this staffer?'
		end
		r += '</span><span>'
	  r += link_to(person.list_name, person) + '</span><span>'
	  r += person.title + '</span><span>'
	  r += person.phone + '</span><span>'
	  r += number_to_currency(person.salary, :precision => 0) + '</span><span>'
	  r += person.hired + '</span>'
		if person.terminated
	  	r += '<span>' + person.terminated + '</span>'
		end
  	r
  end
end
