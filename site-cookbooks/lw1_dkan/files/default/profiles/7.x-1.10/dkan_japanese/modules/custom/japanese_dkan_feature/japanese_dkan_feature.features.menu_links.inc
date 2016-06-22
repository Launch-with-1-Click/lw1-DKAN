<?php
/**
 * @file
 * annai_pre_settings.features.menu_links.inc
 */

/**
 * Implements hook_menu_default_menu_links().
 */
function japanese_dkan_feature_menu_default_menu_links() {
  $menu_links = array();

  // Exported menu link: main-menu_:dataset
  $menu_links['main-menu_:dataset'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'dataset',
    'router_path' => 'dataset',
    'link_title' => 'データセット',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'alter' => TRUE,
      'query' => array(
        'f[0]' => 'type:dataset',
      ),
      'identifier' => 'main-menu_:dataset',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -45,
    'customized' => 1,
    'language' => 'ja',
    'menu_links_customized' => 1,
  );
  // Exported menu link: main-menu_:groups
  $menu_links['main-menu_:groups'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'groups',
    'router_path' => 'groups',
    'link_title' => 'グループ',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'alter' => TRUE,
      'identifier' => 'main-menu_:groups',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -41,
    'customized' => 1,
    'language' => 'ja',
    'menu_links_customized' => 1,
  );
  // Exported menu link: main-menu_:node/1
  $menu_links['main-menu_:node/1'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/1',
    'router_path' => 'node/%',
    'link_title' => 'このサイトについて',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'alter' => TRUE,
      'identifier' => 'main-menu_:node/1',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -47,
    'customized' => 1,
    'language' => 'ja',
    'menu_links_customized' => 1,
  );
  // Exported menu link: main-menu_:node/add/dataset
  $menu_links['main-menu_:node/add/dataset'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/add/dataset',
    'router_path' => 'node/add/dataset',
    'link_title' => 'データセットの追加',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'alter' => TRUE,
      'identifier' => 'main-menu_:node/add/dataset',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -49,
    'customized' => 1,
    'language' => 'ja',
    'menu_links_customized' => 1,
  );
  // Exported menu link: main-menu_:stories
  $menu_links['main-menu_:stories'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'stories',
    'router_path' => 'stories',
    'link_title' => 'ストーリー',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'alter' => TRUE,
      'identifier' => 'main-menu_:stories',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -43,
    'customized' => 1,
    'language' => 'ja',
    'menu_links_customized' => 1,
  );

  // Translatables
  // Included for use with string extractors like potx.
  t('このサイトについて');
  t('グループ');
  t('ストーリー');
  t('データセット');
  t('データセットの追加');

  return $menu_links;
}
