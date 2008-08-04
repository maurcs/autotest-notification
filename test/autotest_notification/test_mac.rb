require File.dirname(__FILE__) + '/../test_helper.rb'

class TestMac < Test::Unit::TestCase
  
  def test_if_last_test_failed_instance_variable_is_defined
    assert !AutotestNotification::Mac::Notify.instance_variable_get(:@last_test_failed)
  end
  
  def test_if_mac_register_handler
    assert AutotestNotification::Notify.handlers.include?(AutotestNotification::Mac::Notify)
  end
  
  def test_understands_so_when_so_is_a_mac
    assert AutotestNotification::Mac::Notify.understands_so?("universal-darwin9.0")
  end
  
  def test_understands_so_when_so_is_noT_a_mac
    assert !AutotestNotification::Mac::Notify.understands_so?("linux")
  end
  
  def test_play_sound_with_no_failures
    AutotestNotification::Mac::Notify.expects(:system).with('say All tests passed successfully.')
    AutotestNotification::Mac::Notify.play_sound(0)
  end
  
  def test_play_sound_with_one_failure
    AutotestNotification::Mac::Notify.expects(:system).with("say 1 test failed.")
    AutotestNotification::Mac::Notify.play_sound(1)
  end
  
  def test_play_sound_with_more_them_one_failure
    AutotestNotification::Mac::Notify.expects(:system).with('say 2 tests failed.')
    AutotestNotification::Mac::Notify.play_sound(2)
  end
  
end

