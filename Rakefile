# -*- coding: utf-8 -*-

APP_ROOT = File.expand_path('..', __FILE__)

$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

$:.unshift File.join(APP_ROOT, 'app/lib')

require 'google/auth_proxy'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'google-oauth2-motion'

  app.vendor_project 'vendor/google-api-objectivec-client/Source', :xcode, :xcodeproj => 'GTL.xcodeproj',
      :scheme => 'GTLTouchStaticLib', :headers_dir => '..'
  %w(Security SystemConfiguration).each { |f| app.frameworks << f unless app.frameworks.include?(f) }
  FileUtils.cp(
      File.join(APP_ROOT, 'vendor/google-api-objectivec-client/Source/OAuth2/Touch/GTMOAuth2ViewTouch.xib'),
      File.join(APP_ROOT, 'resources'))

end
