api = 2
core = 7.x

;just to add patch
;https://www.drupal.org/node/2067229#comment-9267721 to get father dependencies
includes[core] = drupal-org-core.make

;DKAN profile
;includes[dkan] = ../dkan/build-dkan.make

;DKAN Japanese profile (inherits modules from DKAN)
projects[dkan_japanese][type] = profile
projects[dkan_japanese][download][type] = copy
projects[dkan_japanese][download][url] = file:///usr/local/src/dkan_japanese
