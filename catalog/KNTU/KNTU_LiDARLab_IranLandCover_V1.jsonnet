local id = 'KNTU/LiDARLab/IranLandCover/V1';
local subdir = 'KNTU';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc_by_4_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'Iran Land Cover Map v1 13-class (2017)',
  version: 'V1',
  'gee:type': ee_const.gee_type.image,
  description: |||
    The Iran-wide land cover map was generated by processing Sentinel imagery
    within the Google Earth Engine Cloud platform. For this purpose, over 2,500
    Sentinel-1 and over 11,000 Sentinel-2 images were processed to produce a single
    mosaic dataset for the year 2017. Then, an object-based Random Forest
    classification method was trained by a large number of reference samples for 13
    classes to generate the Iran-wide land cover map.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(license.reference),
    {
      rel: ee_const.rel.source,
      href: 'ftp://94.184.181.78:1399/Iran_LC/Iran_LC.rar',
    },
  ],
  keywords: [
    'iran',
    'kntu',
    'landcover',
  ],
  providers: [
    ee.producer_provider('K. N. Toosi University of Technology LiDAR Lab', 'https://en.kntu.ac.ir/laser-scanners-laboratory/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(43.46, 24.62, 65.58, 39.95,
                    '2017-01-01T00:00:00Z', '2018-01-01T00:00:00Z'),
  summaries: {
    'eo:bands': [
      {
        name: 'classification',
        description: 'Classification',
        gsd: 10.0,
        'gee:classes': [
          {
            value: 1,
            color: '000000',
            description: 'Urban',
          },
          {
            value: 2,
            color: '006eff',
            description: 'Water',
          },
          {
            value: 3,
            color: '41a661',
            description: 'Wetland',
          },
          {
            value: 4,
            color: 'ff7f7f',
            description: 'Kalut (yardang)',
          },
          {
            value: 5,
            color: 'bee8ff',
            description: 'Marshland',
          },
          {
            value: 6,
            color: 'ff00c5',
            description: 'Salty Land',
          },
          {
            value: 7,
            color: 'ff0000',
            description: 'Clay',
          },
          {
            value: 8,
            color: '00734c',
            description: 'Forest',
          },
          {
            value: 9,
            color: '732600',
            description: 'Outcrop',
          },
          {
            value: 10,
            color: 'ffaa00',
            description: 'Uncovered Plain',
          },
          {
            value: 11,
            color: 'd3ffbe',
            description: 'Sand',
          },
          {
            value: 12,
            color: '446589',
            description: 'Farm Land',
          },
          {
            value: 13,
            color: 'cccccc',
            description: 'Range Land',
          },
        ],
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Classification',
        lookat: {
          lat: 33.0,
          lon: 54.0,
          zoom: 5,
        },
        image_visualization: {
          band_vis: {
            bands: [
              'classification',
            ],
          },
        },
      },
    ],
  },
  'sci:citation': |||
    Ghorbanian, A., Kakooei, M., Amani, M., Mahdavi, S., Mohammadzadeh, A., &
    Hasanlou, M. (2020). Improved land cover map of Iran using Sentinel imagery
    within Google Earth Engine and a novel automatic workflow for land cover
    classification using migrated training samples. ISPRS Journal of
    Photogrammetry and Remote Sensing, 167, 276-288.
    [doi:10.1016/j.isprsjprs.2020.07.013](https://doi.org/10.1016/j.isprsjprs.2020.07.013)
  |||,
  'gee:terms_of_use': |||
    This work "Iran Land Cover Map
    v1 13-class (2017)" by Arsalan Ghorbanian, Mohammad Kakooei, Meisam Amani,
    Sahel Mahdavi, Ali Mohammadzadeh, Mahdi Hasanlou is licensed under the [Creative
    Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)
  |||,
  'gee:user_uploaded': true,
}
