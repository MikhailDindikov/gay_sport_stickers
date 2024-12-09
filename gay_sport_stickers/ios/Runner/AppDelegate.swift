import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let displayZoomChannel = FlutterMethodChannel(
                  name: "userdef",
                  binaryMessenger: controller.binaryMessenger)
              
              displayZoomChannel.setMethodCallHandler({
                  (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                  switch call.method {
                  case "setUserDef":
                      self.saveValue(call, result: result)
                  case "getUserDef":
                      self.getValue(call, result: result)
                  default:
                      result(FlutterMethodNotImplemented)
                  }
              })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func saveValue(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any>,
           let sname = args["sname"] as? String,
           let key = args["key"] as? String,
           let value = args["value"] as? Int {
            let shared = UserDefaults(suiteName: sname)
            shared?.set(value, forKey: key)
            shared?.synchronize()
            result(nil)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }
    
    private func getValue(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any>,
           let sname = args["sname"] as? String,
           let key = args["key"] as? String {
            let shared = UserDefaults(suiteName: sname)
            result(shared?.integer(forKey: key) ?? 0)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }
}
