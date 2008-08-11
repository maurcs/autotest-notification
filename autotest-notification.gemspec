Gem::Specification.new do |s|
  s.name = %q{autotest-notification}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carlos Brando", "Rodrigo Urubatan", "Alexandre da Silva", "Carlos J\303\272nior", "Davis Zanetti Cabral", "Marcos Tapaj\303\263s", "Thiago Pradi", "Oz\303\251ias Sant'ana"]
  s.date = %q{2008-06-18}
  s.description = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.email = ["eduardobrando@gmail.com"]
  s.executables = ["an-install", "an-uninstall", "playsound"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "README.mkdn"]
  s.files = ["lib/autotest_notification", "lib/autotest_notification/doom.rb", "lib/autotest_notification/linux", "lib/autotest_notification/linux/gnome.rb", "lib/autotest_notification/linux/kde.rb", "lib/autotest_notification/mac.rb", "lib/autotest_notification/notify.rb", "lib/autotest_notification/version.rb", "lib/autotest_notification.rb", "images/doom", "images/doom/doom_0.png", "images/doom/doom_1.png", "images/doom/doom_2.png", "images/doom/doom_3.png", "images/doom/doom_4.png", "images/doom/doom_5.png", "images/doom/doom_6.png", "images/fail.png", "images/pass.png", "sounds/doom", "sounds/doom/0.wav", "sounds/doom/1.wav", "sounds/doom/2.wav", "sounds/doom/3.wav", "sounds/doom/4.wav", "sounds/doom/5.wav", "sounds/doom/6.wav", "test/autotest_notification", "test/autotest_notification/linux", "test/autotest_notification/linux/test_gnome.rb", "test/autotest_notification/linux/test_kde.rb", "test/autotest_notification/test_doom.rb", "test/autotest_notification/test_mac.rb", "test/autotest_notification/test_notify.rb", "test/test_helper.rb", "bin/an-install", "bin/an-uninstall", "bin/playsound", "History.txt", "License.txt", "README.mkdn"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/carlosbrando/autotest-notification/}
  s.post_install_message = %q{
          For more information on autotest_notification, see http://github.com/carlosbrando/autotest-notification/

          To turn on the notifier you need to run the following command:
            an-install

          To turn off:
            an-uninstall

          }
  s.rdoc_options = ["--main", "README.mkdn"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autotest-notification}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.test_files = ["test/autotest_notification", "test/autotest_notification/linux", "test/autotest_notification/linux/test_gnome.rb", "test/autotest_notification/linux/test_kde.rb", "test/autotest_notification/test_doom.rb", "test/autotest_notification/test_mac.rb", "test/autotest_notification/test_notify.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<ZenTest>, [">= 3.9.2"])
    else
      s.add_dependency(%q<ZenTest>, [">= 3.9.2"])
    end
  else
    s.add_dependency(%q<ZenTest>, [">= 3.9.2"])
  end
end
