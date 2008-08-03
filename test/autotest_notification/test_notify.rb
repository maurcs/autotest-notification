require File.dirname(__FILE__) + '/../test_helper.rb'

class TestNotify < Test::Unit::TestCase
  
  def setup
    define_expected_handles
  end
  
  def test_handlers
    assert_equal [String], AutotestNotification::Notify.handlers
  end
  
  def test_add_handler
    AutotestNotification::Notify.add_handler(Integer)
    assert_equal [String, Integer], AutotestNotification::Notify.handlers
  end
  
  def test_guess_when_given_so_has_handler
    String.expects(:understands_so?).with("so").returns(true)
    assert_equal String, AutotestNotification::Notify.guess("so")
  end
  
  def test_guess_when_given_so_has_handler
    String.expects(:understands_so?).with("so").returns(false)
    assert_equal nil, AutotestNotification::Notify.guess("so")
  end
  
  def test_notify
    notify_mock = mock
    notify_mock.expects(:notify).with("title", "msg", "img", 1, 0, 0)
    AutotestNotification::Notify.expects(:guess).with(RUBY_PLATFORM).returns(notify_mock)
    AutotestNotification::Notify.notify("title", "msg", "img", 1, 0, 0)
  end

  def test_pluralize_when_number_is_zero
    assert_equal "0 texts", AutotestNotification::Notify.pluralize("text", 0)
  end
  
  def test_pluralize_when_number_is_one
    assert_equal "1 text", AutotestNotification::Notify.pluralize("text", 1)
  end
  
  def test_pluralize_when_number_is_two
    assert_equal "2 texts", AutotestNotification::Notify.pluralize("text", 2)
  end
  
  def test_unit_test_messages
    AutotestNotification::Notify.expects(:pluralize).with('test', 1).returns(1)
    AutotestNotification::Notify.expects(:pluralize).with('assertion', 2).returns(2)
    AutotestNotification::Notify.expects(:pluralize).with('failure', 3).returns(3)
    AutotestNotification::Notify.expects(:pluralize).with('error', 4).returns(4)
    assert_equal "1, 2, 3, 4", AutotestNotification::Notify.unit_test_message(1,2,3,4)
  end
  
  def test_rspec_message
    AutotestNotification::Notify.expects(:pluralize).with('example', 1).returns(1)
    AutotestNotification::Notify.expects(:pluralize).with('failure', 2).returns(2)
    AutotestNotification::Notify.expects(:pluralize).with('pending', 3).returns(3)
    assert_equal "1, 2, 3", AutotestNotification::Notify.rspec_message(1,2,3)
  end
  
  
  private
  
  def define_expected_handles
    eval "class AutotestNotification::Notify
      @@handlers = [String]
    end"
  end
    
end

