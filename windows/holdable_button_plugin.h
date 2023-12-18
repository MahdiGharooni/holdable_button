#ifndef FLUTTER_PLUGIN_HOLDABLE_BUTTON_PLUGIN_H_
#define FLUTTER_PLUGIN_HOLDABLE_BUTTON_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace holdable_button {

class HoldableButtonPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HoldableButtonPlugin();

  virtual ~HoldableButtonPlugin();

  // Disallow copy and assign.
  HoldableButtonPlugin(const HoldableButtonPlugin&) = delete;
  HoldableButtonPlugin& operator=(const HoldableButtonPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace holdable_button

#endif  // FLUTTER_PLUGIN_HOLDABLE_BUTTON_PLUGIN_H_
