=begin rdoc

= WebGet Ruby Gem: Spreadsheeting import & export helpers

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

== Methods

* import_date: Parse a string to a date, with some cleanup
* import_flag: Converts a set of values into true (x y yes t true on) or false (blank, n, no, f, false, off)
* import_flag_or_note: For when a column contains a flag, a note or both, splits them and returns an array of the flag then the note
* import_date_or_note: For when a column contains a date, a note or both, splits them and returns an array of the date then the note
* export_flag_or_note: Corresponds to import_flag_or_note, but the opposite result
* export_date_or_note: Corresponds to import_date_or_note, but the opposite result

=end


module Spreadsheeting

 # Parse a string to a date, with some cleanup
 def import_date(s)
  return nil if s==nil or s.strip==''
  return Date.parse(s)
 end


 # There's a typical import use case where a column is
 # a boolean, in a variety of formats like "X" for on,
 # "Y" for yes, "T" for true, etc.
 #
 # @return a boolean
 #
 # We use these rules:
 # - x y yes t true on +  => true
 # - blank n no f false off -  => false
 # - anything else => nil
 #
 # ==Examples
 #   import_flag('Yes') => true
 #   import_flag('No') => false
 #   import_flag('X') => true
 #   import_flag('') => false
 #   import_flag('Hello') => nil
 #   import_flag(nil) => nil

 def import_flag(s)
  s==nil and return nil
  case s.strip.downcase
  when 'x','y','yes','t','true','on','+'
   return true
  when '','n','no','f','false','off','-'
   return false
  else 
   return nil
  end
 end


 # There's a typical import use case where a column
 # can contain two different data types:
 # - a boolean, in a variety of formats (see _import_flag_)
 # - a note, in plain text
 #
 # We need to separate these two.
 #
 # This method returns two items: a boolean and a note.
 #
 # We use these rules:
 # - x y yes t true on +  => [true, '']
 # - blank n no f false off -  => [false, '']
 # - any other string => [nil, note]
 # - nil => [nil, nil]
 #
 # ==Example
 #   import_flag_or_note('Yes') => [true,'']
 #   import_flag_or_note('No') => [false,'']
 #   import_flag_or_note('X') => [true,'']
 #   import_flag_or_note('') => [false,'']
 #   import_flag_or_note('Hello') => [nil,'Hello']
 #   import_flag_or_note(nil) => [nil,nil]

 def import_flag_or_note(s)
   return [nil, nil] if s==nil
   flag = import_flag(s)
   return [flag, flag==nil ? s : '']
 end


 # There's a common import use case where a column can be of two types:
 # - a date, in a variety of format like "Jan 1, 2008", "1/1/2008", etc.
 # - a note, in plain text
 #
 # This method returns two items: a date (Date class) and a note (String class).
 #
 # ==Example
 #   import_date_or_note('1/1/2007') => [Date(2007,01,01),'']
 #   import_date_or_note('hello') => [nil,'hello']
 
 def import_date_or_note(s)
  begin
   d=import_date(s)
  rescue
   d=nil
  end
  return d ? [d,''] : [nil,s]
 end


 # Corresponds to import_flag_or_note
 #
 # ==Return
 # - flag==true => 'X'
 # - flag==false => ''
 # - otherwise return note
 #
 # ==Example
 #   t=true
 #   f=false
 #   export_flag_or_note(t,'hello') => 'X'
 #   export_flag_or_note(f,'hello') => ''
 #   export_flag_or_note(nil,'hello') => 'hello'

 def export_flag_or_note(flag,note=nil)
  return flag==true ? 'X' : flag==false ? '' : note
 end


 # Corresponds to import_date_or_note
 #
 # ==Return
 # - date exists => date to yyyy-mm-dd format
 # - otherwise return note
 #
 # ==Example
 #   d=Date.parse('1/1/2007')
 #   export_date_or_note(d,'hello') => '2007-01-01'
 #   export_date_or_note(nil,'hello') => 'hello'

 def export_date_or_note(date,note=nil)
  return date ?  date.strftime("%Y-%m-%d") : note
 end


end
