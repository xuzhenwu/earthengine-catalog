local id = 'LANDSAT/LC08/C01/T1_8DAY_NDVI';
local successor_id = 'LANDSAT/COMPOSITES/C02/T1_L2_8DAY_NDVI';
local subdir = 'LANDSAT';
local latest_id = successor_id;
local version = 'LC08/C01';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc_by_4_0;

local basename = std.strReplace(id, '/', '_');
local successor_basename = std.strReplace(successor_id, '/', '_');
local latest_basename = std.strReplace(latest_id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_ver,
  ],
  id: id,
  version: version,
  deprecated: true,
  title: 'Landsat 8 Collection 1 Tier 1 8-Day NDVI Composite [deprecated]',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    These Landsat 8 Collection 1 Tier 1 composites are made from Tier 1 orthorectified scenes, using the
      computed top-of-atmosphere (TOA) reflectance.
      See [Chander et al. (2009)](https://www.sciencedirect.com/science/article/pii/S0034425709000169)
      for details on the TOA computation.

    The Normalized Difference Vegetation Index is
    generated from the Near-IR and Red bands of each scene as (NIR - Red) /
    (NIR + Red), and ranges in value from -1.0 to 1.0.

    These composites are created from
    all the scenes in each
    8-day period beginning from the first day of the year and continuing
    to the 360th day of the year.  The last composite of the year,
    beginning on day 361, will overlap the first composite of the
    following year by 3 days.  All the images from each 8-day period are
    included in the composite, with the most recent pixel as the composite value.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(license.reference),
    ee.link.latest(latest_id, catalog_subdir_url + latest_basename + '.json'),
    ee.link.successor(
      successor_id, catalog_subdir_url + successor_basename + '.json'),
  ],
  keywords: [
    'landsat',
    'ndvi',
    'usgs',
  ],
  providers: [
    ee.producer_provider('Google', 'https://earthengine.google.com'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('2013-04-07T00:00:00Z', null),
  summaries: {
    'eo:bands': [
      {
        name: 'NDVI',
        description: 'Normalized Difference Vegetation Index',
        gsd: 30.0,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Colorized',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              1.0,
            ],
            palette: [
              'ffffff',
              'ce7e45',
              'df923d',
              'f1b555',
              'fcd163',
              '99b718',
              '74a901',
              '66a000',
              '529400',
              '3e8601',
              '207401',
              '056201',
              '004c00',
              '023b01',
              '012e01',
              '011d01',
              '011301',
            ],
            bands: [
              'NDVI',
            ],
          },
        },
      },
    ],
    NDVI: {
      minimum: -1.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
  },
  'gee:min_zoom_level': 4,
  'gee:interval': {type: 'cadence', unit: 'day', interval: 8},
  'gee:terms_of_use': importstr 'terms_of_use.md',
  'gee:is_derived': true,
}
