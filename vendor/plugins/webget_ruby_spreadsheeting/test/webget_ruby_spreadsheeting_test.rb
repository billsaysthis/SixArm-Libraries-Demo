require 'test/unit'
require 'date'
require 'webget_ruby_spreadsheeting'

class SpreadsheetingTest < Test::Unit::TestCase

  include Spreadsheeting

  def test_import_flag
    assert_equal(true,    import_flag('X'))
    assert_equal(false,   import_flag(''))
    assert_equal(true,    import_flag('yes'))
    assert_equal(false,   import_flag('no'))
    assert_equal(true,    import_flag('+'))
    assert_equal(false,   import_flag('-'))
    assert_equal(nil,     import_flag('hello'))
    assert_equal(nil,     import_flag(nil))
  end

  def test_import_flag_or_note
    assert_equal([true,''],     import_flag_or_note('X'))
    assert_equal([false,''],    import_flag_or_note(''))
    assert_equal([true,''],     import_flag_or_note('yes'))
    assert_equal([false,''],    import_flag_or_note('no'))
    assert_equal([true,''],     import_flag_or_note('+'))
    assert_equal([false,''],    import_flag_or_note('-'))
    assert_equal([nil,'hello'], import_flag_or_note('hello'))
    assert_equal([nil,nil],     import_flag_or_note(nil))
  end

  def test_import_date_or_note
    d=Date.parse('2007/12/31')
    assert_equal([d,''],        import_date_or_note('2007/12/31'))
    assert_equal([nil,'hello'], import_date_or_note('hello'))
  end

  def test_export_flag_or_note
    assert_equal('X',     export_flag_or_note(true,'hello'))
    assert_equal('',      export_flag_or_note(false,'hello'))
    assert_equal('hello', export_flag_or_note(nil,'hello'))
  end

  def test_export_date_or_note
    d=Date.parse('2007/12/31')
    assert_equal('2007-12-31', export_date_or_note(d,'hello'))
    assert_equal('hello',      export_date_or_note(nil,'hello'))
  end

end
