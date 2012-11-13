Pod::Spec.new do |s|
  s.name         = "WebViewJavascriptBridge"
  s.version      = "0.0.1"
  s.summary      = "A standalone iOS class for sending messages to and from javascript in a UIWebView."
  s.homepage     = "http://github.com/marcuswestin/WebViewJavascriptBridge"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "marcuswestin" => "marcus.westin@gmail.com" }
  s.source       = { :git => "https://github.com/marcuswestin/WebViewJavascriptBridge.git", :commit => "77b526375e590dacc2de81ca98dcf5dc9e65fff4" }
  s.platform     = :ios, "4.2"
  s.source_files = "WebViewJavascriptBridge/WebViewJavascriptBridge.{h,m}"
  s.framework    = "UIKit"
  s.dependency     "JSONKit"
end
