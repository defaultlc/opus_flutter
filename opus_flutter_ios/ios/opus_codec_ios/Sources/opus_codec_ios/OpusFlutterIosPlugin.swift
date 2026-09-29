import Flutter

@_silgen_name("opus_ctl_bridge_register")
private func registerOpusControlBridge()

public class OpusFlutterIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    registerOpusControlBridge()
  }
}
