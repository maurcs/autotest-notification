require File.dirname(__FILE__) + '/../../test_helper.rb'

class TestMac < Test::Unit::TestCase
  
  def test_if_last_test_failed_instance_variable_is_defined
    assert !AutotestNotification::Linux::Gnome::Notify.instance_variable_get(:@last_test_failed)
  end
  
  def test_if_mac_register_handler
    assert AutotestNotification::Notify.handlers.include?(AutotestNotification::Linux::Gnome::Notify)
  end
  
  def test_understands_so_when_so_is_a_linux_and_is_gnome
    AutotestNotification::Linux::Gnome::Notify.expects(:has_notify?).returns(true)
    assert AutotestNotification::Linux::Gnome::Notify.understands_so?("linux")
  end
  
  def test_not_understands_so_when_so_is_a_linux_and_is_no_gnome
    AutotestNotification::Linux::Gnome::Notify.expects(:has_notify?).returns(false)
    assert !AutotestNotification::Linux::Gnome::Notify.understands_so?("linux")
  end
  
  def test_understands_so_when_so_is_not_a_linux
    assert !AutotestNotification::Linux::Gnome::Notify.understands_so?("mac")
  end
  
  def test_has_notify
    turn_all_methods_public(AutotestNotification::Linux::Gnome::Notify)
    AutotestNotification::Linux::Gnome::Notify.expects(:system).with("which notify-send 2> /dev/null")
    AutotestNotification::Linux::Gnome::Notify.has_notify?
  end
  
  def test_play_sound_with_no_failures
    AutotestNotification::Linux::Gnome::Notify.play_sound(0)
  end
  
  def test_play_sound_with_one_failure
    AutotestNotification::Linux::Gnome::Notify.play_sound(1)
  end
  
  def test_play_sound_with_more_them_one_failure
    AutotestNotification::Linux::Gnome::Notify.play_sound(2)
  end
  
end

