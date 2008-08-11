require File.dirname(__FILE__) + '/../../test_helper.rb'

class TestMac < Test::Unit::TestCase
  
  def test_if_last_test_failed_instance_variable_is_defined
    assert !AutotestNotification::Linux::KDE::Notify.instance_variable_get(:@last_test_failed)
  end
  
  def test_if_mac_register_handler
    assert AutotestNotification::Notify.handlers.include?(AutotestNotification::Linux::KDE::Notify)
  end
  
  def test_understands_so_when_so_is_a_linux_and_is_kde
    AutotestNotification::Linux::KDE::Notify.expects(:has_kdialog?).returns(true)
    assert AutotestNotification::Linux::KDE::Notify.understands_so?("linux")
  end
  
  def test_not_understands_so_when_so_is_a_linux_and_is_no_kde
    AutotestNotification::Linux::KDE::Notify.expects(:has_kdialog?).returns(false)
    assert !AutotestNotification::Linux::KDE::Notify.understands_so?("linux")
  end
  
  def test_understands_so_when_so_is_not_a_linux
    assert !AutotestNotification::Linux::KDE::Notify.understands_so?("mac")
  end
  
  def test_has_notify
    turn_all_methods_public(AutotestNotification::Linux::KDE::Notify)
    AutotestNotification::Linux::KDE::Notify.expects(:system).with('which kdialog 2> /dev/null')
    AutotestNotification::Linux::KDE::Notify.has_kdialog?
  end
  
  def test_play_sound_with_no_failures
    AutotestNotification::Linux::KDE::Notify.play_sound(0)
  end
  
  def test_play_sound_with_one_failure
    AutotestNotification::Linux::KDE::Notify.play_sound(1)
  end
  
  def test_play_sound_with_more_them_one_failure
    AutotestNotification::Linux::KDE::Notify.play_sound(2)
  end
  
end

