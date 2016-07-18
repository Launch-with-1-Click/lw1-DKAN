<?php
/**
 * @file
 * annai_pre_settings.features.language.inc
 */

/**
 * Implements hook_locale_default_languages().
 */
function japanese_dkan_feature_locale_default_languages() {
  $languages = array();

  // Exported language: en.
  $languages['en'] = array(
    'language' => 'en',
    'name' => 'English',
    'native' => 'English',
    'direction' => 0,
    'enabled' => 1,
    'plurals' => 0,
    'formula' => '',
    'domain' => '',
    'prefix' => 'en',
    'weight' => -9,
  );
  // Exported language: ja.
  $languages['ja'] = array(
    'language' => 'ja',
    'name' => 'Japanese',
    'native' => '日本語',
    'direction' => 0,
    'enabled' => 1,
    'plurals' => 2,
    'formula' => '($n!=1)',
    'domain' => '',
    'prefix' => 'ja',
    'weight' => -10,
  );
  return $languages;
}
