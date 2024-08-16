import Flutter
import UIKit

public class OpenMailPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "open_mail", binaryMessenger: registrar.messenger())
    let instance = OpenMailPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
}
