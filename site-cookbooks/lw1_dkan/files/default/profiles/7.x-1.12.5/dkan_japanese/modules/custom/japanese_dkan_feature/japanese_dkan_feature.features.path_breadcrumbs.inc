<?php
/**
 * @file
 * japanese_dkan_feature.features.path_breacrumbs.inc
 */

/**
 * Implements hook_strongarm().
 */
function japanese_dkan_feature_path_breadcrumbs() {


  $path_breadcrumb = new stdClass();
  $path_breadcrumb->api_version = 1;
  $path_breadcrumb->machine_name = 'dataset_clone';
  $path_breadcrumb->name = 'resource';
  $path_breadcrumb->path = 'node/%node';
  $path_breadcrumb->data = array(
    'titles' => array(
      0 => 'Datasets',
      1 => '%node:field-dataset-ref:0:title',
      2 => '%node:title',
    ),
    'paths' => array(
      0 => 'dataset',
      1 => '%node:field-dataset-ref:0:url',
      2 => '<none>',
    ),
    'home' => 1,
    'translatable' => 1,
    'arguments' => array(
      'node' => array(
        'position' => 1,
        'argument' => 'entity_id:node',
        'settings' => array(
          'identifier' => 'Node: ID',
        ),
      ),
    ),
    'access' => array(
      'plugins' => array(
        1 => array(
          'name' => 'node_type',
          'settings' => array(
            'type' => array(
              'resource' => 'resource',
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
        2 => array(
          'name' => 'node_language',
          'settings' => array(
            'language' => array(
              'current' => 0,
              'default' => 0,
              'no_language' => 0,
              'en' => 0,
              'ja' => 0,
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
      ),
      'logic' => 'and',
    ),
  );
  $path_breadcrumb->weight = 0;


  $path_breadcrumb = new stdClass();
  $path_breadcrumb->api_version = 1;
  $path_breadcrumb->machine_name = 'dataset';
  $path_breadcrumb->name = 'dataset';
  $path_breadcrumb->path = 'node/%node';
  $path_breadcrumb->data = array(
    'titles' => array(
      0 => 'Datasets',
      1 => '%node:title',
    ),
    'paths' => array(
      0 => 'dataset',
      1 => '<none>',
    ),
    'home' => 1,
    'translatable' => 1,
    'arguments' => array(
      'node' => array(
        'position' => 1,
        'argument' => 'entity_id:node',
        'settings' => array(
          'identifier' => 'Node: ID',
        ),
      ),
    ),
    'access' => array(
      'plugins' => array(
        1 => array(
          'name' => 'node_type',
          'settings' => array(
            'type' => array(
              'dataset' => 'dataset',
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
        2 => array(
          'name' => 'node_language',
          'settings' => array(
            'language' => array(
              'current' => 0,
              'default' => 0,
              'no_language' => 0,
              'en' => 0,
              'ja' => 0,
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
      ),
      'logic' => 'and',
    ),
  );
  $path_breadcrumb->weight = 0;


  $path_breadcrumb = new stdClass();
  $path_breadcrumb->api_version = 1;
  $path_breadcrumb->machine_name = 'group';
  $path_breadcrumb->name = 'group';
  $path_breadcrumb->path = 'node/%node';
  $path_breadcrumb->data = array(
    'titles' => array(
      0 => 'Groups',
      1 => '%node:title',
    ),
    'paths' => array(
      0 => 'Groups',
      1 => '<none>',
    ),
    'home' => 1,
    'translatable' => 1,
    'arguments' => array(
      'node' => array(
        'position' => 1,
        'argument' => 'entity_id:node',
        'settings' => array(
          'identifier' => 'Node: ID',
        ),
      ),
    ),
    'access' => array(
      'plugins' => array(
        0 => array(
          'name' => 'node_type',
          'settings' => array(
            'type' => array(
              'group' => 'group',
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
        1 => array(
          'name' => 'node_language',
          'settings' => array(
            'language' => array(
              'current' => 0,
              'default' => 0,
              'no_language' => 0,
              'en' => 0,
              'ja' => 0,
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
      ),
      'logic' => 'and',
    ),
  );
  $path_breadcrumb->weight = 0;

  $path_breadcrumb = new stdClass();
  $path_breadcrumb->api_version = 1;
  $path_breadcrumb->machine_name = 'node_add';
  $path_breadcrumb->name = 'node add';
  $path_breadcrumb->path = 'node/add/%node';
  $path_breadcrumb->data = array(
    'titles' => array(
      0 => 'Add content',
      1 => 'Add %node:type',
    ),
    'paths' => array(
      0 => 'node/add',
      1 => '<none>',
    ),
    'home' => 1,
    'translatable' => 1,
    'arguments' => array(
      'node' => array(
        'position' => 2,
        'argument' => 'node_add',
        'settings' => array(
          'identifier' => 'Node add form: node type',
        ),
      ),
    ),
    'access' => array(
      'plugins' => array(
        0 => array(
          'name' => 'node_language',
          'settings' => array(
            'language' => array(
              'current' => 0,
              'default' => 0,
              'no_language' => 0,
              'en' => 0,
              'ja' => 0,
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
        1 => array(
          'name' => 'node_language',
          'settings' => array(
            'language' => array(
              'current' => 0,
              'default' => 0,
              'no_language' => 0,
              'en' => 0,
              'ja' => 0,
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
      ),
      'logic' => 'and',
    ),
  );
  $path_breadcrumb->weight = 0;

  $path_breadcrumb = new stdClass();
  $path_breadcrumb->api_version = 1;
  $path_breadcrumb->machine_name = 'node_edit';
  $path_breadcrumb->name = 'node edit';
  $path_breadcrumb->path = 'node/%node/edit';
  $path_breadcrumb->data = array(
    'titles' => array(
      0 => 'Edit %node:title',
    ),
    'paths' => array(
      0 => '<none>',
    ),
    'home' => 1,
    'translatable' => 1,
    'arguments' => array(
      'node' => array(
        'position' => 1,
        'argument' => 'entity_id:node',
        'settings' => array(
          'identifier' => 'Node: ID',
        ),
      ),
    ),
    'access' => array(
      'plugins' => array(
        0 => array(
          'name' => 'node_language',
          'settings' => array(
            'language' => array(
              'current' => 0,
              'default' => 0,
              'no_language' => 0,
              'en' => 0,
              'ja' => 0,
            ),
          ),
          'context' => 'node',
          'not' => FALSE,
        ),
      ),
      'logic' => 'and',
    ),
  );
  $path_breadcrumb->weight = 0;


}
