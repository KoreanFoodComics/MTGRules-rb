$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'MTGRules-rb'
    app.device_family = [:iphone, :ipad]
  app.deployment_target = "4.3"
  app.interface_orientations = [:portrait]
  app.info_plist['NSMainNibFile'] = 'IPhoneMainWindow'

  app.pods do
    dependency 'FMDB'
  end
end
