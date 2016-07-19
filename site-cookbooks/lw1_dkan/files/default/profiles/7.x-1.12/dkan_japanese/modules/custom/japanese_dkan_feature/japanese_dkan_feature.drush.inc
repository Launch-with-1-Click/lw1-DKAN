<?php
/**
 * @file
 * This files defines the Drush command used to import files on group texts.
 */

require_once 'includes/locale.inc';

define('LOCALE_AUTO_IMPORT_PO_FOLDER', 'auto_translations');

/**
 * Implements hook_drush_command().
 */
function japanese_dkan_feature_drush_command() {
  $items = array();
  $items['japanese-dkan-feature-locale-import-text-groups'] = array(
    'description' => 'Import all po files using Drush.',
    'callback' => '_japanese_dkan_feature_import_drush_command',
    'bootstrap' => DRUSH_BOOTSTRAP_DRUPAL_SITE,
    'aliases' => array('jdflitg'),
  );
  return $items;
}

/**
 * Command callback that fires up the batch process.
 */
function _japanese_dkan_feature_import_drush_command() {
  drush_print('Pot import initiating...');
  $components = array();
  $modules_list = module_list();
  foreach ($modules_list as $module_name) {
    // Made the path of the "auto_translations" folder.
    $module_path_po = drupal_get_path('module', $module_name) . '/' . LOCALE_AUTO_IMPORT_PO_FOLDER;
    // Check if the "auto_translations" folder is present in the module folder.
    if (file_exists($module_path_po) === TRUE && is_dir($module_path_po) === TRUE) {
      // Get the system name.
      $components[] = check_plain($module_name);
      drush_print('Importing po files from ' . $module_name);
    }
  }
  $mode = LOCALE_IMPORT_OVERWRITE;

  $files = array();
  $languages = language_list('enabled');
  unset($languages[1]['en']);
  if (count($languages[1])) {
    $language_list = implode('|', array_keys($languages[1]));
    // Collect all files to import for all $components.
    $result = db_query("SELECT name, filename FROM {system} WHERE status = 1");
    foreach ($result as $component) {
      if (in_array($component->name, $components)) {
        // Collect all files for this component in all enabled languages, named
        // as $langcode.po, with names ending with $langcode.po or with names
        // ending with $text_group.$langcode.po. This allows for filenames
        // like feature-module.views.fr.po to import the translations for a
        // specific text group for a specific language.
        $files = array_merge($files, file_scan_directory(dirname($component->filename) . '/' . LOCALE_AUTO_IMPORT_PO_FOLDER, '/(^|\.)(' . $language_list . ')\.po$/', array('recurse' => FALSE)));
      }
    }
    return _japanese_dkan_feature_drush_import($files, $mode);
  }
}

/**
 * The real import from locale from files.
 */
function _japanese_dkan_feature_drush_import($files, $mode) {
  $text_groups = module_invoke_all('locale', 'groups');
  foreach ($files as $file) {
    $filepath = $file->uri;
    // The filename is either {langcode}.po, {prefix}.{langcode}.po,
    // {text_group}.{langcode}.po or {prefix}.{text_group}.{langcode}.po,
    // so we can extract the text group and the language code to use
    // for the import from the end.
    if (preg_match('!(/|\.)(([^\./]+)(\.))?([^\./]+)\.po$!', $filepath, $infos)) {
      // $infos[3] = Text group.
      // $infos[5] = Language code.
      $text_group = $infos[3];
      // If the text group is not recognize use "default".
      if (array_key_exists($text_group, $text_groups) === FALSE) {
        $text_group = 'default';
      }
      $file = (object) array(
        'filename' => drupal_basename($filepath),
        'uri' => $filepath,
      );
      drush_print("importing " . $filepath);
      _locale_import_read_po('db-store', $file, $mode, $infos[5], $text_group);
    }
  }
}
