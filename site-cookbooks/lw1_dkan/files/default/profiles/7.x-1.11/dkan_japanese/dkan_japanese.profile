<?php
/**
 * @file
 * Additional setup tasks for DKAN.
 */
require_once ("profiles/dkan/dkan.profile");

function dkan_japanese_install() {
  include_once DRUPAL_ROOT . '/profiles/dkan/dkan.install';
  dkan_install();
}


function dkan_japanese_install_tasks_alter(&$tasks, $install_state) {

  // Hide select language configuration step
  $tasks['install_select_locale']['display'] = FALSE;
  $tasks['install_select_locale']['function'] = 'dkan_japanese_submit_locale_form';

  // Hide the database configuration step.
  $tasks['install_settings_form']['display'] = FALSE;
  $tasks['install_settings_form']['function'] = 'dkan_japanese_install_settings_form_task';
  $tasks['install_settings_form']['type'] = 'normal';

  // Hide the site configuration step.
  $tasks['install_configure_form']['display'] = FALSE;
  $tasks['install_configure_form']['function'] = 'dkan_japanese_install_configure_task';
  $tasks['install_configure_form']['type'] = 'normal';
}

function dkan_japanese_submit_locale_form( &$install_state) {
  $install_state['parameters']['locale'] = 'en';
}

function dkan_japanese_install_settings_form_task(&$install_state) {

  $database = array(
      'database' => 'dkan_japanese',
      'username' => 'dkan',
      'password' => 'dkan',
      'db_prefix' => '',
      'host' => 'localhost',
      'port' => '',
      'driver' => 'mysql'
  );

  $string = file_get_contents(dirname(__FILE__) . '/dbparams.json');
  $params = json_decode($string, true);

  foreach ($params as $key=>$param) {
    $database[$key] = $param;
  }

  // TODO: remove when PIFR will be updated to use 'db_prefix' instead of
  // 'prefix' in the database settings form.
  $database['prefix'] = $database['db_prefix'];
  unset($database['db_prefix']);

  // Update global settings array and save.
  $settings['databases'] = array(
    'value' => array('default' => array('default' => $database)),
    'required' => TRUE,
  );
  $settings['drupal_hash_salt'] = array(
    'value' => drupal_hash_base64(drupal_random_bytes(55)),
    'required' => TRUE,
  );
  drupal_rewrite_settings($settings);
  // Indicate that the settings file has been verified, and check the database
  // for the last completed task, now that we have a valid connection. This
  // last step is important since we want to trigger an error if the new
  // database already has Drupal installed.
  $install_state['settings_verified'] = TRUE;
  $install_state['completed_task'] = install_verify_completed_task();
  return NULL;
}

function dkan_japanese_install_configure_task(&$install_state) {
  //copy from includes/install.core.inc install_configure_form_submit($form, &$form_state)
  global $user;

  $default_values = array(
    'site_name' => 'japanese_dkan',
    'site_mail' => 'japanese_dkan@japanese_dkan.com',
    'date_default_timezone' => 'Asia/Tokyo',
    'site_default_country' => 'Japan',
    'account' => array(
      'name' => 'admin',
      'mail' => 'japanese_dkan@japanese_dkan.com',
      'pass' => 'admin'
    )
  );

  $string = file_get_contents(dirname(__FILE__) . '/configure.json');
  $params = json_decode($string, true);

  foreach ($params as $key=>$param) {
    $default_values[$key] = $param;
  }

  variable_set('site_name', $default_values['site_name']);
  variable_set('site_mail', $default_values['site_mail']);
  variable_set('date_default_timezone', $default_values['date_default_timezone']);
  variable_set('site_default_country', $default_values['site_default_country']);

  // Enable update.module if this option was selected.
  // if ($form_state['values']['update_status_module'][1]) {
  //   module_enable(array('update'), FALSE);
  //
  //   // Add the site maintenance account's email address to the list of
  //   // addresses to be notified when updates are available, if selected.
  //   if ($form_state['values']['update_status_module'][2]) {
  //     variable_set('update_notify_emails', array($form_state['values']['account']['mail']));
  //   }
  // }

  // We precreated user 1 with placeholder values. Let's save the real values.
  $account = user_load(1);
  $merge_data = array('init' => $default_values['account']['mail'], 'roles' => !empty($account->roles) ? $account->roles : array(), 'status' => 1, 'timezone' => $default_values['date_default_timezone']);
  user_save($account, array_merge($default_values['account'], $merge_data));
  // Load global $user and perform final login tasks.
  $user = user_load(1);
  user_login_finalize();

  variable_set('clean_url', TRUE);

  // Record when this install ran.
  variable_set('install_time', $_SERVER['REQUEST_TIME']);
}

/**
 * Implements hook_install_tasks().
 */
function dkan_japanese_install_tasks() {
  //leaving example code
  return array(
    'dkan_japanese_additional_setup' => array(
        'display_name' => t('Japanese DKAN final setup tasks'),
        'display' => FALSE,
        'type' => 'normal',
        'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
    ),
  );
}

/**
 * Japanese DKAN setup task. Runs a series of helper functions defined below.
 */
function dkan_japanese_additional_setup() {
  $context['message'] = t('Translating main menu.');
  $menu_links = menu_load_links('main-menu');
  foreach($menu_links as $link_menu) {
    // story & groups look alright (both ja and en), we should fix the others
    // but kinf of want to create menu from 0 to avoid future problems
    // well actually english (set by feature) groups and story menu cant be
    // deleted. They will remain. All the others get deleted though.
    menu_link_delete($link_menu['mlid']);
  }
  menu_cache_clear_all();
  $menu_item = array(
    'link_path' => 'node/add/dataset',
    'link_title' => 'データセットの追加',
    'menu_name' => 'main-menu',
    'weight' => -47,
    'language' => 'ja',
    'customized' => 1,
    'options' => array(
      'identifier' => 'main-menu_add-dataset:node/add/dataset',
    )
  );
  menu_link_save($menu_item);
  menu_cache_clear_all();
  $menu_item = array(
    'link_path' => 'node/1',
    'link_title' => 'このサイトについて',
    'menu_name' => 'main-menu',
    'weight' => -45,
    'language' => 'ja',
    'customized' => 1,
    'options' => array(
      'identifier' => 'main-menu_about:node/1',
    )
  );
  menu_link_save($menu_item);

  $menu_item = array(
    'link_path' => 'dataset',
    'link_title' => 'データセット',
    'menu_name' => 'main-menu',
    'weight' => -43,
    'language' => 'ja',
    'customized' => 1,
    'options' => array(
      'identifier' => 'main-menu_dataset',
      'query' => array( 'f[0]' => 'type:dataset')
    )
  );
  menu_link_save($menu_item);
  menu_cache_clear_all();
  $menu_item = array(
    'link_path' => 'stories',
    'link_title' => 'ストーリー',
    'menu_name' => 'main-menu',
    'weight' => -41,
    'language' => 'ja',
    'customized' => 1,
    'options' => array(
    )
  );
  menu_link_save($menu_item);
  menu_cache_clear_all();
  $menu_item = array(
    'link_path' => 'groups',
    'link_title' => 'グループ',
    'menu_name' => 'main-menu',
    'weight' => -39,
    'language' => 'ja',
    'customized' => 1,
    'options' => array(
    )
  );
  menu_link_save($menu_item);

  menu_cache_clear_all();
  return NULL;
}
