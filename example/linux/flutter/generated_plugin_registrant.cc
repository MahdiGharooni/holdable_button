//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <holdable_button/holdable_button_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) holdable_button_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "HoldableButtonPlugin");
  holdable_button_plugin_register_with_registrar(holdable_button_registrar);
}
