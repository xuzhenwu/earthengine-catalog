local id = 'projects/ngis-cat/assets/DEA/NIDEM';
local subdir = 'ngis-cat';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.cc_by_4_0;

local version = '1.0.0';

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;

{
  // TODO(schwehr): Remove when the dataset is ready.
  'gee:skip_indexing': true,
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  version: version,
  title: 'National Intertidal Digital Elevation Model 25m ' + version,
  'gee:type': ee_const.gee_type.image,
  description: |||
    The National Intertidal Digital Elevation Model (NIDEM; Bishop-Taylor et
    al. 2018, 2019) is a continental-scale elevation dataset for Australia's
    exposed intertidal zone.
    NIDEM provides the first three-dimensional representation of Australia's
    intertidal sandy beaches and shores, tidal flats and rocky shores and reefs
    at 25 m spatial resolution, addressing a key gap between the availability
    of sub-tidal bathymetry and terrestrial elevation data. NIDEM was generated
    by combining global tidal modelling with a 30-year time series archive of
    spatially and spectrally calibrated Landsat satellite data managed within
    the Digital Earth Australia (DEA) platform.
    NIDEM complements existing intertidal extent products, and provides data to
    support a new suite of use cases that require a more detailed understanding
    of the three-dimensional topography of the intertidal zone, such as
    hydrodynamic modelling, coastal risk management and ecological habitat
    mapping.
    For more information, please see the
    [DEA Intertidal Elevation](https://cmi.ga.gov.au/data-products/dea/325/dea-intertidal-elevation-landsat#basics)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
      ee.link.license(license.reference),
      {
        rel: ee_const.rel.cite_as,
        href: 'https://doi.org/10.1016/j.ecss.2019.03.006',
        type: ee_const.media_type.html,
      },
      {
        rel: ee_const.rel.source,
        href: 'https://dapds00.nci.org.au/thredds/catalog/fk4/datacube/002/NIDEM/geotiff/catalog.html',
      },
    ],
  keywords: [
    'australia',
    // 'dea_australia',
    'dem',
    // 'nidem',
  ],
  providers: [
    ee.producer_provider(
      'Digital Earth Australia',
      'https://cmi.ga.gov.au/data-products/dea/325/dea-intertidal-elevation-landsat'),
    ee.processor_provider('NGIS', 'https://ngis.com.au/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(
    108.81, -44.41, 157.82, -9.13,
    '1986-08-16T00:00:00Z', '2017-07-31T23:59:59Z'),
  summaries: {
    gsd: [25],
    'eo:bands': [
      {
        name: 'nidem',
        description: |||
          Primary product: elevation in meter units relative to modelled Mean
          Sea Level.
          [Band details](https://cmi.ga.gov.au/data-products/dea/325/dea-intertidal-elevation-landsat#details)
        |||,
        'gee:units': units.meter,
      },
      {
        name: 'nidem_mask',
        description: |||
          Quality flag.
          [Band details](https://cmi.ga.gov.au/data-products/dea/325/dea-intertidal-elevation-landsat#details)
        |||,
        'gee:classes':[
          {
            color: '00ff00',
            description: 'above 25 m relative to Mean Sea Level',
            value: 1,
          },
          {
            color: 'ff0000',
            description: 'below -25 m relative to Mean Sea Level',
            value: 2,
          },
          {
            color: 'ffff00',
            description: 'invalid elevation estimates',
            value: 3,
          },
        ],
      },
      {
        name: 'nidem_uncertainty',
        description: |||
          Uncertainty meters.
          [Band details](https://cmi.ga.gov.au/data-products/dea/325/dea-intertidal-elevation-landsat#details)
        |||,
        'gee:units': units.meter,
      },
      {
        name: 'nidem_unfiltered',
        description: |||
          Un-cleaned elevation in meters.
          [Band details](https://cmi.ga.gov.au/data-products/dea/325/dea-intertidal-elevation-landsat#details)
        |||,
        'gee:units': units.meter,
      },
    ],
    nidem: {minimum: -5.0, maximum: 3.9, 'gee:estimated_range': false},
    nidem_uncertainty: {minimum: 0, maximum: 0.3, 'gee:estimated_range': false},
    nidem_unfiltered: {minimum: -5.0, maximum: 3.9, 'gee:estimated_range': false},
    'gee:visualizations': [
      {
        display_name: 'National Intertidal Digital Elevation Model (NIDEM)',
        lookat: {lon: 133.88, lat: -23.70, zoom: 5},
        image_visualization: {
          band_vis: {
            min: [-5.0],
            max: [3.9],
            palette: [
              '440154', '471365', '482475', '463480', '414487', '3b528b',
              '355f8d', '2f6c8e', '2a788e', '25848e', '21918c', '1e9c89',
              '22a884', '2fb47c', '44bf70', '5ec962', '7ad151', '9bd93c',
              'bddf26', 'dfe318', 'fde725',
            ],
            bands: ['nidem']}},
      },
    ],
  },
  'sci:doi': '10.1016/j.ecss.2019.03.006',
  'sci:citation': |||
    Bishop-Taylor, R., Sagar, S., Lymburner, L., & Beaman, R. J. (2019).
    Between the tides: Modelling the elevation of Australia's exposed intertidal
    zone at continental scale.  Estuarine, Coastal and Shelf Science, 223,
    115-128.
    [doi:10.1016/j.ecss.2019.03.006](https://doi.org/10.1016/j.ecss.2019.03.006)
  |||,
  'gee:terms_of_use': ee.gee_terms_of_use(license),
}
