platform :ios, '7.1'

# inhibit all warnings
inhibit_all_warnings!

pod 'FXForms', :head

class ::Pod::Generator::Acknowledgements
def header_text
    "This application uses icons from icons8 (http://icons8.com).\n\nThis application makes use of the following third party libraries:"
end
end

post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Pods-Acknowledgements.plist', 'Grade Calculator/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end
