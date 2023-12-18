#include "include/holdable_button/holdable_button_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "holdable_button_plugin.h"

void HoldableButtonPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  holdable_button::HoldableButtonPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
