api = 2
core = 7.x

; Contrib Modules
projects[potx_exportables][version] = 1.0
projects[potx_exportables][subdir] = contrib

projects[menu_import][version] = 1.7
projects[menu_import][subdir] = contrib

projects[variable][version] = 2.5
projects[variable][subdir] = contrib

projects[i18n][version] = 1.13
;for this issue https://www.drupal.org/node/1697384
projects[i18n][patch][2082573] = https://www.drupal.org/files/issues/i18n_string-undefined-method-2082573-13.patch
projects[i18n][subdir] = contrib


;custom modules
;adding this for documentation purposes only. The module already exists inside
;the profile, there is no need to add it via make file.
;projects[japanese_dkan_feature][subdir] = custom
;projects[japanese_dkan_feature][download][type] = git
;projects[japanese_dkan_feature][download][url] = git@bitbucket.org:annal-inc/japanese_dkan_feature.git
;projects[japanese_dkan_feature][download][tag] = 7.x-1.2
;projects[japanese_dkan_feature][type] = module


; Includes libraries that are used by DKAN,
; because libraries of the parent profile can't be detected.

;from DKAN drupal-org.make file
libraries[japanese_dkan_font_awesome][type] = libraries
libraries[japanese_dkan_font_awesome][download][type] = git
libraries[japanese_dkan_font_awesome][download][url] = "https://github.com/FortAwesome/Font-Awesome.git"
libraries[japanese_dkan_font_awesome][directory_name] = font_awesome
libraries[japanese_dkan_font_awesome][download][revision] = "13d5dd373cbf3f2bddd8ac2ee8df3a1966a62d09"

libraries[japanese_dkan_spyc][type] = libraries
libraries[japanese_dkan_spyc][download][type] = "get"
libraries[japanese_dkan_spyc][download][url] = "https://raw.github.com/mustangostang/spyc/79f61969f63ee77e0d9460bc254a27a671b445f3/spyc.php"
libraries[japanese_dkan_spyc][directory_name] = "spyc"

;from panopoly (master) (referenced by drupal-org.make)
;http://cgit.drupalcode.org/panopoly_images/plain/panopoly_images.make
libraries[japanese_dkan_jquery.imagesloaded][download][type] = file
libraries[japanese_dkan_jquery.imagesloaded][download][url] = https://github.com/desandro/imagesloaded/archive/v2.1.2.tar.gz
libraries[japanese_dkan_jquery.imagesloaded][download][subtree] = imagesloaded-2.1.2
libraries[japanese_dkan_jquery.imagesloaded][directory_name] = "jquery.imagesloaded"

; jquery.imgAreaSelect library for manualcrop
libraries[japanese_dkan_jquery.imgareaselect][download][type] = file
libraries[japanese_dkan_jquery.imgareaselect][download][url] = https://github.com/odyniec/imgareaselect/archive/v0.9.11-rc.1.tar.gz
libraries[japanese_dkan_jquery.imgareaselect][download][subtree] = imgareaselect-0.9.11-rc.1
libraries[japanese_dkan_jquery.imgareaselect][directory_name] = "jquery.imagesloaded"





;from DKAN dataset.make file (tag 7.x-1.11)
;https://github.com/NuCivic/dkan_dataset/blob/7.x-1.11/dkan_dataset.make
libraries[japanese_dkan_chosen][type] = libraries
libraries[japanese_dkan_chosen][download][type] = get
libraries[japanese_dkan_chosen][download][url] = https://github.com/harvesthq/chosen/releases/download/v1.3.0/chosen_v1.3.0.zip
libraries[japanese_dkan_chosen][destination] = libraries
libraries[japanese_dkan_chosen][directory_name] = "chosen"

libraries[japanese_dkan_slugify][type] = libraries
libraries[japanese_dkan_slugify][download][type] = git
libraries[japanese_dkan_slugify][download][url] = "https://github.com/pmcelhaney/jQuery-Slugify-Plugin.git"
libraries[japanese_dkan_slugify][directory_name] = slugify
libraries[japanese_dkan_slugify][download][revision] = "79133a1bdfd3ac80d500d661a722b85c03a01da3"

libraries[japanese_dkan_arc][type] = libraries
libraries[japanese_dkan_arc][download][type] = git
libraries[japanese_dkan_arc][download][url] = "https://github.com/semsol/arc2.git"
libraries[japanese_dkan_arc][download][revision] = "44c396ab54178086c09499a1704e31a977b836d2"
libraries[japanese_dkan_arc][subdir] = "ARC2"
libraries[japanese_dkan_arc][directory_name] = "arc"

libraries[japanese_dkan_excanvas][download][type] = "file"
libraries[japanese_dkan_excanvas][download][url] = "https://explorercanvas.googlecode.com/files/excanvas_r3.zip"
libraries[japanese_dkan_excanvas][download][sha1] = "f1b9f7a44428eb0c7b27fe8ac0242d34ec94a385"
libraries[japanese_dkan_excanvas][directory_name] = "excanvas"



;from leaflet_wdiget.make (master) (include from DKAN dataset)
;https://github.com/NuCivic/leaflet_draw_widget/blob/master/leaflet_widget.make
libraries[japanese_dkan_leaflet_draw][type] = libraries
libraries[japanese_dkan_leaflet_draw][download][type] = git
libraries[japanese_dkan_leaflet_draw][download][url] = "https://github.com/Leaflet/Leaflet.draw.git"
libraries[japanese_dkan_leaflet_draw][download][tag] = "v0.2.4"
libraries[japanese_dkan_leaflet_draw][directory_name] = "leaflet_draw"

libraries[japanese_dkan_leaflet_core][type] = libraries
libraries[japanese_dkan_leaflet_core][download][type] = git
libraries[japanese_dkan_leaflet_core][download][url] = "https://github.com/Leaflet/Leaflet.git"
libraries[japanese_dkan_leaflet_core][download][tag] = "v0.7.3"
libraries[japanese_dkan_leaflet_core][directory_name] = "leaflet_core"

;from recline.make (master) (include from DKAN dataset)
;also include fom visualization_entity
;https://github.com/NuCivic/recline/blob/7.x-1.11/recline.make
# RECLINE
libraries[japanese_dkan_recline][type] = libraries
libraries[japanese_dkan_recline][download][type] = git
libraries[japanese_dkan_recline][download][url] = "https://github.com/NuCivic/recline.js.git"
libraries[japanese_dkan_recline][download][revision] = "a7eea3f80254648290592824886298df87768f47"
libraries[japanese_dkan_recline][directory_name] = "recline"

# LODASH
libraries[japanese_dkan_lodash][type] = libraries
libraries[japanese_dkan_lodash][download][type] = git
libraries[japanese_dkan_lodash][download][url] = "https://github.com/lodash/lodash.git"
libraries[japanese_dkan_lodash][download][revision] = "e21e993729861a2bc1d01c858cfabce7a27d2861"
libraries[japanese_dkan_lodash][directory_name] = "lodash"

# BACKBONE
libraries[japanese_dkan_backbone][type] = libraries
libraries[japanese_dkan_backbone][download][type] = git
libraries[japanese_dkan_backbone][download][url] = "https://github.com/jashkenas/backbone.git"
libraries[japanese_dkan_backbone][download][revision] = "e109f6d3e7a366f933f1f34405ca97effecae6c5"
libraries[japanese_dkan_backbone][directory_name] = "backbone"

# CSV BACKEND
libraries[japanese_dkan_csv][type] = libraries
libraries[japanese_dkan_csv][download][type] = git
libraries[japanese_dkan_csv][download][url] = "https://github.com/okfn/csv.js.git"
libraries[japanese_dkan_csv][download][revision] = "976b61384a1808eb464aca5876e5ea46c98deaee"
libraries[japanese_dkan_csv][directory_name] = "csv"

# SLICKGRID
libraries[japanese_dkan_slickgrid][type] = libraries
libraries[japanese_dkan_slickgrid][download][type] = git
libraries[japanese_dkan_slickgrid][download][url] = "https://github.com/mleibman/SlickGrid.git"
libraries[japanese_dkan_slickgrid][download][revision] = "e004912b5ce29ac0d0cb04df50fe66db5e3af9ea"
libraries[japanese_dkan_slickgrid][directory_name] = "slickgrid"

# MUSTACHE
libraries[japanese_dkan_mustache][type] = libraries
libraries[japanese_dkan_mustache][download][type] = git
libraries[japanese_dkan_mustache][download][url] = "https://github.com/janl/mustache.js.git"
libraries[japanese_dkan_mustache][download][revision] = "d4ba5a19d4d04b139bbf7840fe342bb43930aee3"
libraries[japanese_dkan_mustache][directory_name] = "mustache"

# MOMENT
libraries[japanese_dkan_moment][type] = libraries
libraries[japanese_dkan_moment][download][type] = git
libraries[japanese_dkan_moment][download][url] = "https://github.com/moment/moment.git"
libraries[japanese_dkan_moment][download][revision] = "78a53b8cb53e967c6dac2e7325e18da2a472fc2d"
libraries[japanese_dkan_moment][directory_name] = "moment"

# LEAFLET
libraries[japanese_dkan_leaflet][type] = libraries
libraries[japanese_dkan_leaflet][download][type] = git
libraries[japanese_dkan_leaflet][download][url] = "https://github.com/Leaflet/Leaflet.git"
libraries[japanese_dkan_leaflet][download][revision] = "8a5fdfc6e3db2807b8f0dd617474e4ab2949142b"
libraries[japanese_dkan_leaflet][directory_name] = "leaflet"

# FLOT
libraries[japanese_dkan_flot][type] = libraries
libraries[japanese_dkan_flot][download][type] = git
libraries[japanese_dkan_flot][download][url] = "https://github.com/flot/flot.git"
libraries[japanese_dkan_flot][download][revision] = "7f5f90384ed6d6c30b232580d358c84e355919ab"
libraries[japanese_dkan_flot][directory_name] = "flot"

# FLITBIT
libraries[japanese_dkan_deep_diff][type] = libraries
libraries[japanese_dkan_deep_diff][download][type] = git
libraries[japanese_dkan_deep_diff][download][url] = "https://github.com/flitbit/diff.git"
libraries[japanese_dkan_deep_diff][directory_name] = deep_diff
libraries[japanese_dkan_deep_diff][download][revision] = "07e91c624e5016be5c5c6560a9eabe49ef3ba2d0"

# DEEPLINK
libraries[japanese_dkan_recline_deeplink][type] = libraries
libraries[japanese_dkan_recline_deeplink][download][type] = git
libraries[japanese_dkan_recline_deeplink][download][url] = "https://github.com/NuCivic/recline-deeplink.git"
libraries[japanese_dkan_recline_deeplink][directory_name] = recline_deeplink
libraries[japanese_dkan_recline_deeplink][download][revision] = "c1695d669f8314ed8b66e5907eb4f1bc4a8a9495"

# MARKER CLUSTER
libraries[japanese_dkan_leaflet_markercluster][type] = libraries
libraries[japanese_dkan_leaflet_markercluster][download][type] = git
libraries[japanese_dkan_leaflet_markercluster][download][url] = "https://github.com/Leaflet/Leaflet.markercluster.git"
libraries[japanese_dkan_leaflet_markercluster][directory_name] = leaflet_markercluster
libraries[japanese_dkan_leaflet_markercluster][download][revision] = "c5864dbfca9e71c86ac61b432862cc77f8fd8e68"


;from visualization_entity.make file (master)
;https://github.com/NuCivic/visualization_entity/blob/master/visualization_entity.make
libraries[japanese_dkan_chroma][download][type] = "file"
libraries[japanese_dkan_chroma][download][url] = "https://github.com/gka/chroma.js/zipball/master"
libraries[japanese_dkan_chroma][directory_name] = "chroma"

libraries[japanese_dkan_numeral][download][type] = "file"
libraries[japanese_dkan_numeral][download][url] = "https://github.com/adamwdraper/Numeral-js/zipball/master"
libraries[japanese_dkan_numeral][directory_name] = "numeral"

libraries[japanese_dkan_recline_choropleth][download][type] = "file"
libraries[japanese_dkan_recline_choropleth][download][url] = "https://github.com/NuCivic/recline.view.choroplethmap.js/archive/master.zip"
libraries[japanese_dkan_recline_choropleth][directory_name] = "recline_choropleth"

;from geo file entity (master) (referenced by visualization_entity - via git)
;https://github.com/NuCivic/geo_file_entity/blob/master/geo_file_entity.make
libraries[japanese_dkan_leaflet_zoomtogeometries][download][type] = "file"
libraries[japanese_dkan_leaflet_zoomtogeometries][download][url] = "https://github.com/NuCivic/leaflet.map.zoomToGeometries.js/zipball/master"
libraries[japanese_dkan_leaflet_zoomtogeometries][directory_name] = "leaflet_zoomtogeometries"


;from visualization_entity_charts.make file (master)
;https://github.com/NuCivic/visualization_entity_charts/blob/master/visualization_entity_charts.make
# NVD3
libraries[japanese_dkan_nvd3][type] = libraries
libraries[japanese_dkan_nvd3][download][type] = git
libraries[japanese_dkan_nvd3][download][url] = "https://github.com/novus/nvd3.git"
libraries[japanese_dkan_nvd3][download][revision] = "7ebd54ca09061022a248bec9a050a4dec93e2b28"
libraries[japanese_dkan_nvd3][directory_name] = "nvd3"

# D3
libraries[japanese_dkan_d3][type] = libraries
libraries[japanese_dkan_d3][download][type] = git
libraries[japanese_dkan_d3][download][url] = "https://github.com/mbostock/d3.git"
libraries[japanese_dkan_d3][download][revision] = "f82dd6fb414a15bca4f9c39c7c9442295ddea416"
libraries[japanese_dkan_d3][directory_name] = "d3"

# GDOCS BACKEND
libraries[japanese_dkan_gdocs][type] = libraries
libraries[japanese_dkan_gdocs][download][type] = git
libraries[japanese_dkan_gdocs][download][url] = "https://github.com/okfn/recline.backend.gdocs.git"
libraries[japanese_dkan_gdocs][download][revision] = "e81bb237759353932834a38a0ec810441e0ada10"
libraries[japanese_dkan_gdocs][directory_name] = "gdocs"

# LODASH DATA
libraries[japanese_dkan_lodash_data][type] = libraries
libraries[japanese_dkan_lodash_data][download][type] = git
libraries[japanese_dkan_lodash_data][download][url] = "https://github.com/NuCivic/lodash.data.git"
libraries[japanese_dkan_lodash_data][download][revision] = "0dbe0701003b8a45037ab5fada630db2dbf75d9d"
libraries[japanese_dkan_lodash_data][directory_name] = "lodash_data"

# SPECTRUM COLORPICKER
libraries[japanese_dkan_spectrum][type] = libraries
libraries[japanese_dkan_spectrum][download][type] = git
libraries[japanese_dkan_spectrum][download][url] = "https://github.com/bgrins/spectrum.git"
libraries[japanese_dkan_spectrum][download][revision] = "98454b55521cfb495f628db28af01100c029ef76"
libraries[japanese_dkan_spectrum][directory_name] = "spectrum"

# RECLINE NVD3 VIEW
libraries[japanese_dkan_reclineViewNvd3][type] = libraries
libraries[japanese_dkan_reclineViewNvd3][download][type] = git
libraries[japanese_dkan_reclineViewNvd3][download][url] = "https://github.com/NuCivic/recline.view.nvd3.js.git"
libraries[japanese_dkan_reclineViewNvd3][download][branch] = master
libraries[japanese_dkan_reclineViewNvd3][directory_name] = "reclineViewNvd3"
