local id = 'projects/neon-aop/assets/chm';
local subdir = 'neon-aop';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc0_1_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

local units = import 'units.libsonnet';

{
  // TODO(schwehr): Remove when the dataset is ready.
  'gee:skip_indexing': true,

  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
  ],
  id: id,
  title: 'NEON Canopy Height Model (CHM)',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    Height of the top of canopy above bare earth (Canopy Height Model; CHM).
    The CHM is derived from the LiDAR point cloud, and is generated by creating 
    a continuous surface of canopy height estimates across the entire spatial 
    domain of the LiDAR survey. The point cloud is separated into classes 
    representing the ground and vegetation returns. The ground classified 
    points allow for calculation of a height-normalized point cloud to 
    provide a relative estimate of vegetation elevation. A surface is then
    generated using the height normalized vegetation points to produce the
    CHM. Any canopy heights less than 2m are set to zero for data collected with
    the Optech Gemini LiDAR sensors, and less than 2/3m for the Riegl and Optech
    Galaxy sensors. Data are mosaicked over the AOP footprint onto a spatially 
    uniform grid at 1 m spatial resolution. 

    See [NEON Data Product DP3.30015.001](
    https://data.neonscience.org/data-products/DP3.30015.001) for
    more details.

    Documentation: [NEON Ecosystem structure (DP3.30015.001) Quick StartGuide](
    https://data.neonscience.org/api/v0/documents/quick-start-guides/NEON.QSG.DP3.30015.001v1?inline=true&fallback=html)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(license.reference),
    // TODO(bhass-neon): Add doi link.
    // {
    //   rel: ee_const.rel.cite_as,
    //   href: '',
    //   type: ee_const.media_type.html,
    // },
  ],
  keywords: [
    # 'airborne',
    # 'canopy',
    # 'ecology',
    'forest',
    'lidar',
    # 'neon',
    'vegetation',
  ],
  providers: [
    ee.producer_provider('NEON', 'https://www.neonscience.org/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-170, 16, -66, 73, '2013-01-01T00:00:00Z', null),
  summaries: {
    'gee:schema': [
      {
        name: 'AOP_VISIT_NUMBER',
        description: 'Unique visit number to the NEON site',
        type: ee_const.var_type.string,
      },
      {
        name: 'CITATION',
        description: 'Data citation. See ' +
        '[NEON Data Policies and Citation Guidelines]' +
        '(https://www.neonscience.org/data-samples/data-policies-citation)',
        type: ee_const.var_type.string,
      },
      {
        name: 'DOI',
        description: 'Digital Object Identifier. NEON data that have been released are assigned a DOI.',
        type: ee_const.var_type.string,
      },      
      {
        name: 'FLIGHT_YEAR',
        description: 'Year the data were collected',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_DOMAIN',
        description:
          'NEON eco-climatic domain code, "D01" to "D20". See ' +
          '[NEON Field Sites and Domains]' +
          '(https://www.neonscience.org/field-sites/about-field-sites)',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_SITE',
        description: 'NEON four-digit site code. See ' +
        '[NEON Field Sites](https://www.neonscience.org/field-sites/)',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_DATA_PROD_ID',
        description: 'NEON data product identification code. Always set to: "DP3.30015.001"',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_DATA_PROD_URL',
        description: 'NEON data product url. Always set to: ' +
        '[https://data.neonscience.org/data-products/DP3.30015.001]' +
        '(https://data.neonscience.org/data-products/DP3.30015.001)',
        type: ee_const.var_type.string,
      },
      {
        name: 'PRODUCT_TYPE',
        description: 'Acronym of the NEON data product type; CHM = Canopy Height Model',
        type: ee_const.var_type.string,
      },
      {
        name: 'SENSOR_NAME',
        description: 'Make and model of the lidar sensor: "Optech Galaxy Prime", "Optech Gemini", "Riegl Q780"',
        type: ee_const.var_type.string,
      },
      {
        name: 'SENSOR_SERIAL',
        description: 'Serial number of the lidar sensor: "12SEN311", "11SEN287", "5060445", "220855"',
        type: ee_const.var_type.string,
      },
      {
        name: 'RELEASE_TAG',
        description: 'NEON Release Tag. See ' +
        '[https://www.neonscience.org/data-samples/data-management/data-revisions-releases]' +
        '(https://www.neonscience.org/data-samples/data-management/data-revisions-releases)',
        type: ee_const.var_type.string,
      },
    ],
    gsd: [1],
    platform: ['NEON'],
    instruments: ['Optech Galaxy Prime', 'Optech Gemini', 'Riegl Q780'],
    'eo:bands': [{
      name: 'CHM',
      description: 'Canopy Height Model',
      'gee:units': units.meter,
    }],
    // TODO(bhass-neon): Add the range values for CHM.
    CHM: {minimum: 0, maximum: 100, 'gee:estimated_range': false},
    'gee:visualizations': [{
      display_name: 'Canopy Height Model (CHM)',
      lookat: {lon: -119.25, lat: 37.06, zoom: 12},
      image_visualization: {
        band_vis: {
          min: [0],
          max: [50],
          bands: ['CHM'],
        },
      },
    }],
  },
  // TODO(bhass-neon): Add sci:doi and set sci:citation to APA version of the doi.
  'sci:citation': 'See [NEON citation guidelines](https://www.neonscience.org/data-samples/guidelines-policies/citing)',
  'gee:terms_of_use': ee.gee_terms_of_use(license) + '\n\n' + |||
    All data collected by NEON and provided as data products, with the exception
    of data related to rare, threatened, or endangered (RTE) species, are
    released to the public domain under [Creative Commons CC0 1.0 "No Rights
    Reserved"](https://creativecommons.org/publicdomain/zero/1.0/).  No
    copyright has been applied to NEON data; any person may copy, modify, or
    distribute the data, for commercial or non-commercial purposes, without
    asking for permission. NEON data may still be subject to other laws or
    rights such as for privacy, and NEON makes no warranties about the data and
    disclaims all liability. When using or citing NEON data, no implication
    should be made about endorsement by NEON. In most countries, data and facts
    are not copyrightable.  By putting NEON data into the public domain, we
    encourage broad use, particularly in scientific analyses and data
    aggregations. However, please be aware of the following scholarly norms:
    NEON data should be used in a way that is mindful of the limitations of the
    data, using the documentation associated with the data packages as a
    guide. Please refer to [NEON Data Guidelines and
    Policies](https://www.neonscience.org/data-samples/guidelines-policies) for
    detailed information on how to properly use and cite NEON data, as well as
    best practices for publishing research that uses NEON data.
  |||,
}
