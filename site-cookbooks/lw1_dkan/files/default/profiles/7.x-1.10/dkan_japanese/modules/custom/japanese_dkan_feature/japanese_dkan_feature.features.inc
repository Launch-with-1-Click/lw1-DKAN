<?php
/**
 * @file
 * annai_pre_settings.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function japanese_dkan_feature_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
