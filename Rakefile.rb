require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'lib/autotest_notification/version'

desc "Default Task"
task :default => [ :test ]

# Run the unit tests
Rake::TestTask.new { |t|
  t.libs << "test"
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
  t.warning = false
}

spec = Gem::Specification.new do |s|
  s.name = %q{autotest-notification}
  s.version = AutotestNotification::VERSION::STRING

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carlos Brando", "Rodrigo Urubatan", "Alexandre da Silva", "Carlos J\303\272nior", "Davis Zanetti Cabral", "Marcos Tapaj\303\263s", "Thiago Pradi", "Oz\303\251ias Sant'ana"]
  s.date = %q{2008-06-18}
  s.description = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.email = ["eduardobrando@gmail.com"]
  s.executables = ["an-install", "an-uninstall", "playsound"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "README.mkdn"]
  s.files = Dir.glob( "lib/**/*" ) + Dir.glob( "images/**/*" ) + Dir.glob( "sounds/**/*" ) 
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
  s.rubygems_version = %q{1.1.1}
  s.summary = %q{This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.}
  s.test_files = Dir.glob( "test/**/*" )

  s.add_dependency(%q<ZenTest>, [">= 3.9.2"])
end

namespace :gem do
  namespace :spec do
    desc "Update dejour.gemspec"
    task :generate do
      File.open("autotest-notification.gemspec", "w") do |f|
        f.puts(spec.to_ruby)
      end
    end
  end
end



Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end