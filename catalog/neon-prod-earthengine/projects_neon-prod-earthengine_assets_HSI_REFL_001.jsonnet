local id = 'projects/neon-prod-earthengine/assets/HSI_REFL/001';
local subdir = 'neon-prod-earthengine';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
  ],
  id: id,
  title: 'NEON Directional Surface Reflectance',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The NEON AOP surface directional reflectance data is an orthorectified 
    hyperspectral VSWIR (visible to shortwave infrared) data product, containing 
    426 bands spanning wavelengths from ~380 nm to 2510 nm. Wavelengths 
    between 1340-1445 nm and 1790-1955 nm are set to -100; these are water vapor 
    absorption bands without valid values. The dataset also contains additional 
    QA and raster bands (B427 - B442). Data are collected by one of three NEON 
    Imaging Spectrometer units, AVIRIS-NG sensors built by NASA's Jet Propulsion 
    Lab (JPL). Major corrections include calibration, orthorectification, and 
    atmospheric correction. Reflectance is converted to a mosaic from flightlines 
    using the nadir-most pixels from the flight lines observed with the least 
    cloud cover. Spatial resolution is 1 m and spectral resolution is ~5 nm. 

    See [NEON Data Product
    DP3.30006.001](https://data.neonscience.org/data-products/DP3.30006.001) for
    more details.

    Documentation: [NEON DP3.30006.001 Spectrometer orthorectified surface directional reflectance - mosaic Quick Start
    Guide](https://data.neonscience.org/api/v0/documents/quick-start-guides/NEON.QSG.DP3.30006.001v1?inline=true&fallback=html)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
#    'airborne',
    'canopy',
#    'ecology',
    'forest',
#    'hyperspectral',
#    'neon',
    'reflectance',
#    'surface-reflectance',
    'vegetation',
  ],
  providers: [
    ee.producer_provider('NEON', 'https://data.neonscience.org/data-products/DP3.30006.001'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-170, 16, -66, 73, '2013-01-01T00:00:00Z', null),
  summaries: {
    'gee:schema': [
      {
        name: 'AOP_VISIT_NUMBER',
        description: 'Unique visit number to the NEON site',
        type: ee_const.var_type.int,
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
        type: ee_const.var_type.int,
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
        description: 'NEON data product identification code. Always set to: "DP3.30006.001"',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_DATA_PROD_URL',
        description: 'NEON data product url. Always set to: ' +
        '[https://data.neonscience.org/data-products/DP3.30010.001]' +
        '(https://data.neonscience.org/data-products/DP3.30010.001)',
        type: ee_const.var_type.string,
      },
      {
        name: 'PROVISIONAL_RELEASED',
        description: 'Whether the data are Provisional or Released. See ' +
        '[https://www.neonscience.org/data-samples/data-management/data-revisions-releases]' +
        '(https://www.neonscience.org/data-samples/data-management/data-revisions-releases)',
        type: ee_const.var_type.string,
      },
      {
        name: 'RELEASE_YEAR',
        description: 'If data are released, the year of the NEON Release Tag.',
        type: ee_const.var_type.int,
      },
      {
        name: 'SCALE_FACTOR',
        description: 'Reflectance scale factor used',
        type: ee_const.var_type.double,
      },
      {
        name: 'SENSOR_ID',
        description: 'ID of NEON Imaging Spectrometer (NIS). The Global Airborne Observatory (GAO) sensor has also been used to collect the NEON D20 site: "NIS1", "NIS2", "NIS3", "GAO"',
        type: ee_const.var_type.double,
      },
    ],
    platform: [
      'NEON',
    ],
    instruments: [
      'NIS1, NIS2, NIS3, GAO',
    ],
    'eo:bands': [
     {
      name: "B001",
      description: "VNIR Band B001",
      'gee:units': "unitless",
      center_wavelength:0.3822599947,
      full_width_half_max:0.0056785,
      'gee:wavelength': "382.2587nm, FWHM: 5.6785nm"
     },
     {
      name: "B002",
      description: "VNIR Band B002",
      'gee:units': "unitless",
      center_wavelength:0.3872700036,
      full_width_half_max:0.0056773564,
      'gee:wavelength': "387.2674nm, FWHM: 5.6774nm"
     },
     {
      name: "B003",
      description: "VNIR Band B003",
      'gee:units': "unitless",
      center_wavelength:0.3922800124,
      full_width_half_max:0.0056762281,
      'gee:wavelength': "392.2761nm, FWHM: 5.6762nm"
     },
     {
      name: "B004",
      description: "VNIR Band B004",
      'gee:units': "unitless",
      center_wavelength:0.3972800076,
      full_width_half_max:0.0056751114,
      'gee:wavelength': "397.2848nm, FWHM: 5.6751nm"
     },
     {
      name: "B005",
      description: "VNIR Band B005",
      'gee:units': "unitless",
      center_wavelength:0.4022899866,
      full_width_half_max:0.005674012,
      'gee:wavelength': "402.2935nm, FWHM: 5.674nm"
     },
     {
      name: "B006",
      description: "VNIR Band B006",
      'gee:units': "unitless",
      center_wavelength:0.4072999954,
      full_width_half_max:0.0056729242,
      'gee:wavelength': "407.3022nm, FWHM: 5.6729nm"
     },
     {
      name: "B007",
      description: "VNIR Band B007",
      'gee:units': "unitless",
      center_wavelength:0.4123100042,
      full_width_half_max:0.0056718513,
      'gee:wavelength': "412.3109nm, FWHM: 5.6719nm"
     },
     {
      name: "B008",
      description: "VNIR Band B008",
      'gee:units': "unitless",
      center_wavelength:0.417320013,
      full_width_half_max:0.0056707938,
      'gee:wavelength': "417.3195nm, FWHM: 5.6708nm"
     },
     {
      name: "B009",
      description: "VNIR Band B009",
      'gee:units': "unitless",
      center_wavelength:0.4223299921,
      full_width_half_max:0.0056697489,
      'gee:wavelength': "422.3282nm, FWHM: 5.6697nm"
     },
     {
      name: "B010",
      description: "VNIR Band B010",
      'gee:units': "unitless",
      center_wavelength:0.4273400009,
      full_width_half_max:0.0056687188,
      'gee:wavelength': "427.3369nm, FWHM: 5.6687nm"
     },
     {
      name: "B011",
      description: "VNIR Band B011",
      'gee:units': "unitless",
      center_wavelength:0.4323500097,
      full_width_half_max:0.0056677032,
      'gee:wavelength': "432.3455nm, FWHM: 5.6677nm"
     },
     {
      name: "B012",
      description: "VNIR Band B012",
      'gee:units': "unitless",
      center_wavelength:0.4373500049,
      full_width_half_max:0.0056667035,
      'gee:wavelength': "437.3542nm, FWHM: 5.6667nm"
     },
     {
      name: "B013",
      description: "VNIR Band B013",
      'gee:units': "unitless",
      center_wavelength:0.4423600137,
      full_width_half_max:0.0056657158,
      'gee:wavelength': "442.363nm, FWHM: 5.6657nm"
     },
     {
      name: "B014",
      description: "VNIR Band B014",
      'gee:units': "unitless",
      center_wavelength:0.4473699927,
      full_width_half_max:0.0056647412,
      'gee:wavelength': "447.3716nm, FWHM: 5.6647nm"
     },
     {
      name: "B015",
      description: "VNIR Band B015",
      'gee:units': "unitless",
      center_wavelength:0.4523800015,
      full_width_half_max:0.0056637828,
      'gee:wavelength': "452.3804nm, FWHM: 5.6638nm"
     },
     {
      name: "B016",
      description: "VNIR Band B016",
      'gee:units': "unitless",
      center_wavelength:0.4573900104,
      full_width_half_max:0.0056628371,
      'gee:wavelength': "457.389nm, FWHM: 5.6628nm"
     },
     {
      name: "B017",
      description: "VNIR Band B017",
      'gee:units': "unitless",
      center_wavelength:0.4623999894,
      full_width_half_max:0.0056619085,
      'gee:wavelength': "462.3978nm, FWHM: 5.6619nm"
     },
     {
      name: "B018",
      description: "VNIR Band B018",
      'gee:units': "unitless",
      center_wavelength:0.4674099982,
      full_width_half_max:0.005660994,
      'gee:wavelength': "467.4064nm, FWHM: 5.661nm"
     },
     {
      name: "B019",
      description: "VNIR Band B019",
      'gee:units': "unitless",
      center_wavelength:0.472420007,
      full_width_half_max:0.0056600892,
      'gee:wavelength': "472.415nm, FWHM: 5.6601nm"
     },
     {
      name: "B020",
      description: "VNIR Band B020",
      'gee:units': "unitless",
      center_wavelength:0.4774200022,
      full_width_half_max:0.0056592058,
      'gee:wavelength': "477.4238nm, FWHM: 5.6592nm"
     },
     {
      name: "B021",
      description: "VNIR Band B021",
      'gee:units': "unitless",
      center_wavelength:0.482430011,
      full_width_half_max:0.0056583304,
      'gee:wavelength': "482.4324nm, FWHM: 5.6583nm"
     },
     {
      name: "B022",
      description: "VNIR Band B022",
      'gee:units': "unitless",
      center_wavelength:0.48743999,
      full_width_half_max:0.0056574722,
      'gee:wavelength': "487.4412nm, FWHM: 5.6575nm"
     },
     {
      name: "B023",
      description: "VNIR Band B023",
      'gee:units': "unitless",
      center_wavelength:0.4924499989,
      full_width_half_max:0.0056566275,
      'gee:wavelength': "492.4498nm, FWHM: 5.6566nm"
     },
     {
      name: "B024",
      description: "VNIR Band B024",
      'gee:units': "unitless",
      center_wavelength:0.4974600077,
      full_width_half_max:0.0056557991,
      'gee:wavelength': "497.4585nm, FWHM: 5.6558nm"
     },
     {
      name: "B025",
      description: "VNIR Band B025",
      'gee:units': "unitless",
      center_wavelength:0.5024700165,
      full_width_half_max:0.0056549837,
      'gee:wavelength': "502.4672nm, FWHM: 5.655nm"
     },
     {
      name: "B026",
      description: "VNIR Band B026",
      'gee:units': "unitless",
      center_wavelength:0.5074800253,
      full_width_half_max:0.0056541818,
      'gee:wavelength': "507.4759nm, FWHM: 5.6542nm"
     },
     {
      name: "B027",
      description: "VNIR Band B027",
      'gee:units': "unitless",
      center_wavelength:0.5124800205,
      full_width_half_max:0.005653393,
      'gee:wavelength': "512.4846nm, FWHM: 5.6534nm"
     },
     {
      name: "B028",
      description: "VNIR Band B028",
      'gee:units': "unitless",
      center_wavelength:0.5174900293,
      full_width_half_max:0.0056526223,
      'gee:wavelength': "517.4932nm, FWHM: 5.6526nm"
     },
     {
      name: "B029",
      description: "VNIR Band B029",
      'gee:units': "unitless",
      center_wavelength:0.5224999785,
      full_width_half_max:0.0056518633,
      'gee:wavelength': "522.502nm, FWHM: 5.6519nm"
     },
     {
      name: "B030",
      description: "VNIR Band B030",
      'gee:units': "unitless",
      center_wavelength:0.5275099874,
      full_width_half_max:0.0056511215,
      'gee:wavelength': "527.5106nm, FWHM: 5.6511nm"
     },
     {
      name: "B031",
      description: "VNIR Band B031",
      'gee:units': "unitless",
      center_wavelength:0.5325199962,
      full_width_half_max:0.0056503909,
      'gee:wavelength': "532.5194nm, FWHM: 5.6504nm"
     },
     {
      name: "B032",
      description: "VNIR Band B032",
      'gee:units': "unitless",
      center_wavelength:0.537530005,
      full_width_half_max:0.0056496765,
      'gee:wavelength': "537.528nm, FWHM: 5.6497nm"
     },
     {
      name: "B033",
      description: "VNIR Band B033",
      'gee:units': "unitless",
      center_wavelength:0.5425400138,
      full_width_half_max:0.0056489757,
      'gee:wavelength': "542.5367nm, FWHM: 5.649nm"
     },
     {
      name: "B034",
      description: "VNIR Band B034",
      'gee:units': "unitless",
      center_wavelength:0.5475500226,
      full_width_half_max:0.0056482893,
      'gee:wavelength': "547.5454nm, FWHM: 5.6483nm"
     },
     {
      name: "B035",
      description: "VNIR Band B035",
      'gee:units': "unitless",
      center_wavelength:0.5525500178,
      full_width_half_max:0.0056476151,
      'gee:wavelength': "552.5542nm, FWHM: 5.6476nm"
     },
     {
      name: "B036",
      description: "VNIR Band B036",
      'gee:units': "unitless",
      center_wavelength:0.5575600266,
      full_width_half_max:0.0056469585,
      'gee:wavelength': "557.5628nm, FWHM: 5.647nm"
     },
     {
      name: "B037",
      description: "VNIR Band B037",
      'gee:units': "unitless",
      center_wavelength:0.5625699759,
      full_width_half_max:0.0056463163,
      'gee:wavelength': "562.5714nm, FWHM: 5.6463nm"
     },
     {
      name: "B038",
      description: "VNIR Band B038",
      'gee:units': "unitless",
      center_wavelength:0.5675799847,
      full_width_half_max:0.0056456872,
      'gee:wavelength': "567.5802nm, FWHM: 5.6457nm"
     },
     {
      name: "B039",
      description: "VNIR Band B039",
      'gee:units': "unitless",
      center_wavelength:0.5725899935,
      full_width_half_max:0.005645073,
      'gee:wavelength': "572.5888nm, FWHM: 5.6451nm"
     },
     {
      name: "B040",
      description: "VNIR Band B040",
      'gee:units': "unitless",
      center_wavelength:0.5776000023,
      full_width_half_max:0.0056444737,
      'gee:wavelength': "577.5974nm, FWHM: 5.6445nm"
     },
     {
      name: "B041",
      description: "VNIR Band B041",
      'gee:units': "unitless",
      center_wavelength:0.5826100111,
      full_width_half_max:0.005643887,
      'gee:wavelength': "582.6062nm, FWHM: 5.6439nm"
     },
     {
      name: "B042",
      description: "VNIR Band B042",
      'gee:units': "unitless",
      center_wavelength:0.5876100063,
      full_width_half_max:0.0056433147,
      'gee:wavelength': "587.6148nm, FWHM: 5.6433nm"
     },
     {
      name: "B043",
      description: "VNIR Band B043",
      'gee:units': "unitless",
      center_wavelength:0.5926200151,
      full_width_half_max:0.0056427587,
      'gee:wavelength': "592.6236nm, FWHM: 5.6428nm"
     },
     {
      name: "B044",
      description: "VNIR Band B044",
      'gee:units': "unitless",
      center_wavelength:0.597630024,
      full_width_half_max:0.005642218,
      'gee:wavelength': "597.6322nm, FWHM: 5.6422nm"
     },
     {
      name: "B045",
      description: "VNIR Band B045",
      'gee:units': "unitless",
      center_wavelength:0.6026399732,
      full_width_half_max:0.00564169,
      'gee:wavelength': "602.641nm, FWHM: 5.6417nm"
     },
     {
      name: "B046",
      description: "VNIR Band B046",
      'gee:units': "unitless",
      center_wavelength:0.607649982,
      full_width_half_max:0.0056411773,
      'gee:wavelength': "607.6496nm, FWHM: 5.6412nm"
     },
     {
      name: "B047",
      description: "VNIR Band B047",
      'gee:units': "unitless",
      center_wavelength:0.6126599908,
      full_width_half_max:0.0056406772,
      'gee:wavelength': "612.6584nm, FWHM: 5.6407nm"
     },
     {
      name: "B048",
      description: "VNIR Band B048",
      'gee:units': "unitless",
      center_wavelength:0.6176699996,
      full_width_half_max:0.0056401929,
      'gee:wavelength': "617.667nm, FWHM: 5.6402nm"
     },
     {
      name: "B049",
      description: "VNIR Band B049",
      'gee:units': "unitless",
      center_wavelength:0.6226800084,
      full_width_half_max:0.005639724,
      'gee:wavelength': "622.6757nm, FWHM: 5.6397nm"
     },
     {
      name: "B050",
      description: "VNIR Band B050",
      'gee:units': "unitless",
      center_wavelength:0.6276800036,
      full_width_half_max:0.0056392686,
      'gee:wavelength': "627.6844nm, FWHM: 5.6393nm"
     },
     {
      name: "B051",
      description: "VNIR Band B051",
      'gee:units': "unitless",
      center_wavelength:0.6326900125,
      full_width_half_max:0.0056388266,
      'gee:wavelength': "632.693nm, FWHM: 5.6388nm"
     },
     {
      name: "B052",
      description: "VNIR Band B052",
      'gee:units': "unitless",
      center_wavelength:0.6377000213,
      full_width_half_max:0.0056384006,
      'gee:wavelength': "637.7017nm, FWHM: 5.6384nm"
     },
     {
      name: "B053",
      description: "VNIR Band B053",
      'gee:units': "unitless",
      center_wavelength:0.6427099705,
      full_width_half_max:0.005637988,
      'gee:wavelength': "642.7104nm, FWHM: 5.638nm"
     },
     {
      name: "B054",
      description: "VNIR Band B054",
      'gee:units': "unitless",
      center_wavelength:0.6477199793,
      full_width_half_max:0.005637588,
      'gee:wavelength': "647.7191nm, FWHM: 5.6376nm"
     },
     {
      name: "B055",
      description: "VNIR Band B055",
      'gee:units': "unitless",
      center_wavelength:0.6527299881,
      full_width_half_max:0.0056372057,
      'gee:wavelength': "652.7278nm, FWHM: 5.6372nm"
     },
     {
      name: "B056",
      description: "VNIR Band B056",
      'gee:units': "unitless",
      center_wavelength:0.6577399969,
      full_width_half_max:0.0056368378,
      'gee:wavelength': "657.7365nm, FWHM: 5.6368nm"
     },
     {
      name: "B057",
      description: "VNIR Band B057",
      'gee:units': "unitless",
      center_wavelength:0.6627500057,
      full_width_half_max:0.0056364825,
      'gee:wavelength': "662.7452nm, FWHM: 5.6365nm"
     },
     {
      name: "B058",
      description: "VNIR Band B058",
      'gee:units': "unitless",
      center_wavelength:0.667750001,
      full_width_half_max:0.0056361421,
      'gee:wavelength': "667.7538nm, FWHM: 5.6361nm"
     },
     {
      name: "B059",
      description: "VNIR Band B059",
      'gee:units': "unitless",
      center_wavelength:0.6727600098,
      full_width_half_max:0.0056358157,
      'gee:wavelength': "672.7626nm, FWHM: 5.6358nm"
     },
     {
      name: "B060",
      description: "VNIR Band B060",
      'gee:units': "unitless",
      center_wavelength:0.6777700186,
      full_width_half_max:0.0056355055,
      'gee:wavelength': "677.7712nm, FWHM: 5.6355nm"
     },
     {
      name: "B061",
      description: "VNIR Band B061",
      'gee:units': "unitless",
      center_wavelength:0.6827800274,
      full_width_half_max:0.0056352103,
      'gee:wavelength': "682.78nm, FWHM: 5.6352nm"
     },
     {
      name: "B062",
      description: "VNIR Band B062",
      'gee:units': "unitless",
      center_wavelength:0.6877899766,
      full_width_half_max:0.0056349258,
      'gee:wavelength': "687.7886nm, FWHM: 5.6349nm"
     },
     {
      name: "B063",
      description: "VNIR Band B063",
      'gee:units': "unitless",
      center_wavelength:0.6927999854,
      full_width_half_max:0.005634659,
      'gee:wavelength': "692.7974nm, FWHM: 5.6347nm"
     },
     {
      name: "B064",
      description: "VNIR Band B064",
      'gee:units': "unitless",
      center_wavelength:0.6978099942,
      full_width_half_max:0.0056344066,
      'gee:wavelength': "697.806nm, FWHM: 5.6344nm"
     },
     {
      name: "B065",
      description: "VNIR Band B065",
      'gee:units': "unitless",
      center_wavelength:0.7028099895,
      full_width_half_max:0.0056341663,
      'gee:wavelength': "702.8148nm, FWHM: 5.6342nm"
     },
     {
      name: "B066",
      description: "VNIR Band B066",
      'gee:units': "unitless",
      center_wavelength:0.7078199983,
      full_width_half_max:0.0056339414,
      'gee:wavelength': "707.8233nm, FWHM: 5.6339nm"
     },
     {
      name: "B067",
      description: "VNIR Band B067",
      'gee:units': "unitless",
      center_wavelength:0.7128300071,
      full_width_half_max:0.0056337304,
      'gee:wavelength': "712.832nm, FWHM: 5.6337nm"
     },
     {
      name: "B068",
      description: "VNIR Band B068",
      'gee:units': "unitless",
      center_wavelength:0.7178400159,
      full_width_half_max:0.0056335358,
      'gee:wavelength': "717.8408nm, FWHM: 5.6335nm"
     },
     {
      name: "B069",
      description: "VNIR Band B069",
      'gee:units': "unitless",
      center_wavelength:0.7228500247,
      full_width_half_max:0.0056333551,
      'gee:wavelength': "722.8495nm, FWHM: 5.6334nm"
     },
     {
      name: "B070",
      description: "VNIR Band B070",
      'gee:units': "unitless",
      center_wavelength:0.7278599739,
      full_width_half_max:0.0056331889,
      'gee:wavelength': "727.858nm, FWHM: 5.6332nm"
     },
     {
      name: "B071",
      description: "VNIR Band B071",
      'gee:units': "unitless",
      center_wavelength:0.7328699827,
      full_width_half_max:0.0056330352,
      'gee:wavelength': "732.8668nm, FWHM: 5.633nm"
     },
     {
      name: "B072",
      description: "VNIR Band B072",
      'gee:units': "unitless",
      center_wavelength:0.7378799915,
      full_width_half_max:0.0056328978,
      'gee:wavelength': "737.8754nm, FWHM: 5.6329nm"
     },
     {
      name: "B073",
      description: "VNIR Band B073",
      'gee:units': "unitless",
      center_wavelength:0.7428799868,
      full_width_half_max:0.005632773,
      'gee:wavelength': "742.8842nm, FWHM: 5.6328nm"
     },
     {
      name: "B074",
      description: "VNIR Band B074",
      'gee:units': "unitless",
      center_wavelength:0.7478899956,
      full_width_half_max:0.0056326641,
      'gee:wavelength': "747.8928nm, FWHM: 5.6327nm"
     },
     {
      name: "B075",
      description: "VNIR Band B075",
      'gee:units': "unitless",
      center_wavelength:0.7529000044,
      full_width_half_max:0.00563257,
      'gee:wavelength': "752.9016nm, FWHM: 5.6326nm"
     },
     {
      name: "B076",
      description: "VNIR Band B076",
      'gee:units': "unitless",
      center_wavelength:0.7579100132,
      full_width_half_max:0.0056324895,
      'gee:wavelength': "757.9102nm, FWHM: 5.6325nm"
     },
     {
      name: "B077",
      description: "VNIR Band B077",
      'gee:units': "unitless",
      center_wavelength:0.762920022,
      full_width_half_max:0.0056324238,
      'gee:wavelength': "762.9189nm, FWHM: 5.6324nm"
     },
     {
      name: "B078",
      description: "VNIR Band B078",
      'gee:units': "unitless",
      center_wavelength:0.7679299712,
      full_width_half_max:0.0056323716,
      'gee:wavelength': "767.9276nm, FWHM: 5.6324nm"
     },
     {
      name: "B079",
      description: "VNIR Band B079",
      'gee:units': "unitless",
      center_wavelength:0.77293998,
      full_width_half_max:0.0056323353,
      'gee:wavelength': "772.9364nm, FWHM: 5.6323nm"
     },
     {
      name: "B080",
      description: "VNIR Band B080",
      'gee:units': "unitless",
      center_wavelength:0.7779399753,
      full_width_half_max:0.005632312,
      'gee:wavelength': "777.945nm, FWHM: 5.6323nm"
     },
     {
      name: "B081",
      description: "VNIR Band B081",
      'gee:units': "unitless",
      center_wavelength:0.7829499841,
      full_width_half_max:0.0056323027,
      'gee:wavelength': "782.9538nm, FWHM: 5.6323nm"
     },
     {
      name: "B082",
      description: "VNIR Band B082",
      'gee:units': "unitless",
      center_wavelength:0.7879599929,
      full_width_half_max:0.0056323116,
      'gee:wavelength': "787.9624nm, FWHM: 5.6323nm"
     },
     {
      name: "B083",
      description: "VNIR Band B083",
      'gee:units': "unitless",
      center_wavelength:0.7929700017,
      full_width_half_max:0.0056323302,
      'gee:wavelength': "792.9712nm, FWHM: 5.6323nm"
     },
     {
      name: "B084",
      description: "VNIR Band B084",
      'gee:units': "unitless",
      center_wavelength:0.7979800105,
      full_width_half_max:0.0056323661,
      'gee:wavelength': "797.9798nm, FWHM: 5.6324nm"
     },
     {
      name: "B085",
      description: "VNIR Band B085",
      'gee:units': "unitless",
      center_wavelength:0.8029900193,
      full_width_half_max:0.0056324136,
      'gee:wavelength': "802.9884nm, FWHM: 5.6324nm"
     },
     {
      name: "B086",
      description: "VNIR Band B086",
      'gee:units': "unitless",
      center_wavelength:0.8080000281,
      full_width_half_max:0.0056324783,
      'gee:wavelength': "807.997nm, FWHM: 5.6325nm"
     },
     {
      name: "B087",
      description: "VNIR Band B087",
      'gee:units': "unitless",
      center_wavelength:0.8130099773,
      full_width_half_max:0.0056325565,
      'gee:wavelength': "813.0058nm, FWHM: 5.6326nm"
     },
     {
      name: "B088",
      description: "VNIR Band B088",
      'gee:units': "unitless",
      center_wavelength:0.8180099726,
      full_width_half_max:0.0056326492,
      'gee:wavelength': "818.0144nm, FWHM: 5.6326nm"
     },
     {
      name: "B089",
      description: "VNIR Band B089",
      'gee:units': "unitless",
      center_wavelength:0.8230199814,
      full_width_half_max:0.0056327539,
      'gee:wavelength': "823.023nm, FWHM: 5.6328nm"
     },
     {
      name: "B090",
      description: "VNIR Band B090",
      'gee:units': "unitless",
      center_wavelength:0.8280299902,
      full_width_half_max:0.005632875,
      'gee:wavelength': "828.0318nm, FWHM: 5.6329nm"
     },
     {
      name: "B091",
      description: "VNIR Band B091",
      'gee:units': "unitless",
      center_wavelength:0.833039999,
      full_width_half_max:0.0056330119,
      'gee:wavelength': "833.0404nm, FWHM: 5.633nm"
     },
     {
      name: "B092",
      description: "VNIR Band B092",
      'gee:units': "unitless",
      center_wavelength:0.8380500078,
      full_width_half_max:0.0056331605,
      'gee:wavelength': "838.0492nm, FWHM: 5.6332nm"
     },
     {
      name: "B093",
      description: "VNIR Band B093",
      'gee:units': "unitless",
      center_wavelength:0.8430600166,
      full_width_half_max:0.0056333262,
      'gee:wavelength': "843.0579nm, FWHM: 5.6333nm"
     },
     {
      name: "B094",
      description: "VNIR Band B094",
      'gee:units': "unitless",
      center_wavelength:0.8480700254,
      full_width_half_max:0.0056335037,
      'gee:wavelength': "848.0665nm, FWHM: 5.6335nm"
     },
     {
      name: "B095",
      description: "VNIR Band B095",
      'gee:units': "unitless",
      center_wavelength:0.8530799747,
      full_width_half_max:0.0056336951,
      'gee:wavelength': "853.0753nm, FWHM: 5.6337nm"
     },
     {
      name: "B096",
      description: "VNIR Band B096",
      'gee:units': "unitless",
      center_wavelength:0.8580800295,
      full_width_half_max:0.0056339032,
      'gee:wavelength': "858.084nm, FWHM: 5.6339nm"
     },
     {
      name: "B097",
      description: "VNIR Band B097",
      'gee:units': "unitless",
      center_wavelength:0.8630899787,
      full_width_half_max:0.0056341244,
      'gee:wavelength': "863.0927nm, FWHM: 5.6341nm"
     },
     {
      name: "B098",
      description: "VNIR Band B098",
      'gee:units': "unitless",
      center_wavelength:0.8680999875,
      full_width_half_max:0.0056343623,
      'gee:wavelength': "868.1014nm, FWHM: 5.6344nm"
     },
     {
      name: "B099",
      description: "VNIR Band B099",
      'gee:units': "unitless",
      center_wavelength:0.8731099963,
      full_width_half_max:0.0056346124,
      'gee:wavelength': "873.11nm, FWHM: 5.6346nm"
     },
     {
      name: "B100",
      description: "VNIR Band B100",
      'gee:units': "unitless",
      center_wavelength:0.8781200051,
      full_width_half_max:0.0056348769,
      'gee:wavelength': "878.1187nm, FWHM: 5.6349nm"
     },
     {
      name: "B101",
      description: "VNIR Band B101",
      'gee:units': "unitless",
      center_wavelength:0.8831300139,
      full_width_half_max:0.0056351544,
      'gee:wavelength': "883.1274nm, FWHM: 5.6352nm"
     },
     {
      name: "B102",
      description: "VNIR Band B102",
      'gee:units': "unitless",
      center_wavelength:0.8881400228,
      full_width_half_max:0.0056354478,
      'gee:wavelength': "888.1361nm, FWHM: 5.6354nm"
     },
     {
      name: "B103",
      description: "VNIR Band B103",
      'gee:units': "unitless",
      center_wavelength:0.893140018,
      full_width_half_max:0.0056357561,
      'gee:wavelength': "893.1447nm, FWHM: 5.6358nm"
     },
     {
      name: "B104",
      description: "VNIR Band B104",
      'gee:units': "unitless",
      center_wavelength:0.8981500268,
      full_width_half_max:0.0056360769,
      'gee:wavelength': "898.1534nm, FWHM: 5.6361nm"
     },
     {
      name: "B105",
      description: "VNIR Band B105",
      'gee:units': "unitless",
      center_wavelength:0.903159976,
      full_width_half_max:0.0056364127,
      'gee:wavelength': "903.1621nm, FWHM: 5.6364nm"
     },
     {
      name: "B106",
      description: "VNIR Band B106",
      'gee:units': "unitless",
      center_wavelength:0.9081699848,
      full_width_half_max:0.0056367624,
      'gee:wavelength': "908.1708nm, FWHM: 5.6368nm"
     },
     {
      name: "B107",
      description: "VNIR Band B107",
      'gee:units': "unitless",
      center_wavelength:0.9131799936,
      full_width_half_max:0.0056371279,
      'gee:wavelength': "913.1795nm, FWHM: 5.6371nm"
     },
     {
      name: "B108",
      description: "VNIR Band B108",
      'gee:units': "unitless",
      center_wavelength:0.9181900024,
      full_width_half_max:0.0056375042,
      'gee:wavelength': "918.1882nm, FWHM: 5.6375nm"
     },
     {
      name: "B109",
      description: "VNIR Band B109",
      'gee:units': "unitless",
      center_wavelength:0.9232000113,
      full_width_half_max:0.0056378986,
      'gee:wavelength': "923.1968nm, FWHM: 5.6379nm"
     },
     {
      name: "B110",
      description: "VNIR Band B110",
      'gee:units': "unitless",
      center_wavelength:0.9282100201,
      full_width_half_max:0.0056383056,
      'gee:wavelength': "928.2056nm, FWHM: 5.6383nm"
     },
     {
      name: "B111",
      description: "VNIR Band B111",
      'gee:units': "unitless",
      center_wavelength:0.9332100153,
      full_width_half_max:0.0056387265,
      'gee:wavelength': "933.2143nm, FWHM: 5.6387nm"
     },
     {
      name: "B112",
      description: "VNIR Band B112",
      'gee:units': "unitless",
      center_wavelength:0.9382200241,
      full_width_half_max:0.005639161,
      'gee:wavelength': "938.223nm, FWHM: 5.6392nm"
     },
     {
      name: "B113",
      description: "VNIR Band B113",
      'gee:units': "unitless",
      center_wavelength:0.9432299733,
      full_width_half_max:0.0056396113,
      'gee:wavelength': "943.2316nm, FWHM: 5.6396nm"
     },
     {
      name: "B114",
      description: "VNIR Band B114",
      'gee:units': "unitless",
      center_wavelength:0.9482399821,
      full_width_half_max:0.0056400751,
      'gee:wavelength': "948.2403nm, FWHM: 5.6401nm"
     },
     {
      name: "B115",
      description: "VNIR Band B115",
      'gee:units': "unitless",
      center_wavelength:0.9532499909,
      full_width_half_max:0.0056405538,
      'gee:wavelength': "953.249nm, FWHM: 5.6406nm"
     },
     {
      name: "B116",
      description: "VNIR Band B116",
      'gee:units': "unitless",
      center_wavelength:0.9582599998,
      full_width_half_max:0.0056410446,
      'gee:wavelength': "958.2578nm, FWHM: 5.641nm"
     },
     {
      name: "B117",
      description: "VNIR Band B117",
      'gee:units': "unitless",
      center_wavelength:0.9632700086,
      full_width_half_max:0.0056415522,
      'gee:wavelength': "963.2663nm, FWHM: 5.6416nm"
     },
     {
      name: "B118",
      description: "VNIR Band B118",
      'gee:units': "unitless",
      center_wavelength:0.9682700038,
      full_width_half_max:0.0056420751,
      'gee:wavelength': "968.275nm, FWHM: 5.6421nm"
     },
     {
      name: "B119",
      description: "VNIR Band B119",
      'gee:units': "unitless",
      center_wavelength:0.9732800126,
      full_width_half_max:0.0056426087,
      'gee:wavelength': "973.2838nm, FWHM: 5.6426nm"
     },
     {
      name: "B120",
      description: "VNIR Band B120",
      'gee:units': "unitless",
      center_wavelength:0.9782900214,
      full_width_half_max:0.0056431582,
      'gee:wavelength': "978.2924nm, FWHM: 5.6432nm"
     },
     {
      name: "B121",
      description: "VNIR Band B121",
      'gee:units': "unitless",
      center_wavelength:0.9832999706,
      full_width_half_max:0.0056437212,
      'gee:wavelength': "983.301nm, FWHM: 5.6437nm"
     },
     {
      name: "B122",
      description: "VNIR Band B122",
      'gee:units': "unitless",
      center_wavelength:0.9883099794,
      full_width_half_max:0.0056442977,
      'gee:wavelength': "988.3098nm, FWHM: 5.6443nm"
     },
     {
      name: "B123",
      description: "VNIR Band B123",
      'gee:units': "unitless",
      center_wavelength:0.9933199883,
      full_width_half_max:0.0056448905,
      'gee:wavelength': "993.3184nm, FWHM: 5.6449nm"
     },
     {
      name: "B124",
      description: "VNIR Band B124",
      'gee:units': "unitless",
      center_wavelength:0.9983299971,
      full_width_half_max:0.0056454954,
      'gee:wavelength': "998.3272nm, FWHM: 5.6455nm"
     },
     {
      name: "B125",
      description: "VNIR Band B125",
      'gee:units': "unitless",
      center_wavelength:1.0033400059,
      full_width_half_max:0.0056461152,
      'gee:wavelength': "1003.3359nm, FWHM: 5.6461nm"
     },
     {
      name: "B126",
      description: "VNIR Band B126",
      'gee:units': "unitless",
      center_wavelength:1.0083400011,
      full_width_half_max:0.0056467499,
      'gee:wavelength': "1008.3444nm, FWHM: 5.6468nm"
     },
     {
      name: "B127",
      description: "VNIR Band B127",
      'gee:units': "unitless",
      center_wavelength:1.0133500099,
      full_width_half_max:0.0056473976,
      'gee:wavelength': "1013.3532nm, FWHM: 5.6474nm"
     },
     {
      name: "B128",
      description: "VNIR Band B128",
      'gee:units': "unitless",
      center_wavelength:1.0183600187,
      full_width_half_max:0.0056480598,
      'gee:wavelength': "1018.3619nm, FWHM: 5.6481nm"
     },
     {
      name: "B129",
      description: "VNIR Band B129",
      'gee:units': "unitless",
      center_wavelength:1.0233700275,
      full_width_half_max:0.005648735,
      'gee:wavelength': "1023.3706nm, FWHM: 5.6487nm"
     },
     {
      name: "B130",
      description: "VNIR Band B130",
      'gee:units': "unitless",
      center_wavelength:1.0283800364,
      full_width_half_max:0.0056494256,
      'gee:wavelength': "1028.3793nm, FWHM: 5.6494nm"
     },
     {
      name: "B131",
      description: "VNIR Band B131",
      'gee:units': "unitless",
      center_wavelength:1.0333900452,
      full_width_half_max:0.0056501301,
      'gee:wavelength': "1033.388nm, FWHM: 5.6501nm"
     },
     {
      name: "B132",
      description: "VNIR Band B132",
      'gee:units': "unitless",
      center_wavelength:1.038400054,
      full_width_half_max:0.0056508486,
      'gee:wavelength': "1038.3966nm, FWHM: 5.6508nm"
     },
     {
      name: "B133",
      description: "VNIR Band B133",
      'gee:units': "unitless",
      center_wavelength:1.0434099436,
      full_width_half_max:0.0056515802,
      'gee:wavelength': "1043.4054nm, FWHM: 5.6516nm"
     },
     {
      name: "B134",
      description: "VNIR Band B134",
      'gee:units': "unitless",
      center_wavelength:1.048410058,
      full_width_half_max:0.0056523271,
      'gee:wavelength': "1048.414nm, FWHM: 5.6523nm"
     },
     {
      name: "B135",
      description: "VNIR Band B135",
      'gee:units': "unitless",
      center_wavelength:1.0534199476,
      full_width_half_max:0.005653087,
      'gee:wavelength': "1053.4227nm, FWHM: 5.6531nm"
     },
     {
      name: "B136",
      description: "VNIR Band B136",
      'gee:units': "unitless",
      center_wavelength:1.0584299564,
      full_width_half_max:0.0056538647,
      'gee:wavelength': "1058.4314nm, FWHM: 5.6539nm"
     },
     {
      name: "B137",
      description: "VNIR Band B137",
      'gee:units': "unitless",
      center_wavelength:1.0634399652,
      full_width_half_max:0.0056546521,
      'gee:wavelength': "1063.4401nm, FWHM: 5.6547nm"
     },
     {
      name: "B138",
      description: "VNIR Band B138",
      'gee:units': "unitless",
      center_wavelength:1.0684499741,
      full_width_half_max:0.005655454,
      'gee:wavelength': "1068.4487nm, FWHM: 5.6555nm"
     },
     {
      name: "B139",
      description: "VNIR Band B139",
      'gee:units': "unitless",
      center_wavelength:1.0734599829,
      full_width_half_max:0.0056562694,
      'gee:wavelength': "1073.4574nm, FWHM: 5.6563nm"
     },
     {
      name: "B140",
      description: "VNIR Band B140",
      'gee:units': "unitless",
      center_wavelength:1.0784699917,
      full_width_half_max:0.0056570992,
      'gee:wavelength': "1078.4661nm, FWHM: 5.6571nm"
     },
     {
      name: "B141",
      description: "VNIR Band B141",
      'gee:units': "unitless",
      center_wavelength:1.0834699869,
      full_width_half_max:0.0056579439,
      'gee:wavelength': "1083.4749nm, FWHM: 5.6579nm"
     },
     {
      name: "B142",
      description: "VNIR Band B142",
      'gee:units': "unitless",
      center_wavelength:1.0884799957,
      full_width_half_max:0.0056588026,
      'gee:wavelength': "1088.4836nm, FWHM: 5.6588nm"
     },
     {
      name: "B143",
      description: "VNIR Band B143",
      'gee:units': "unitless",
      center_wavelength:1.0934900045,
      full_width_half_max:0.0056596762,
      'gee:wavelength': "1093.4922nm, FWHM: 5.6597nm"
     },
     {
      name: "B144",
      description: "VNIR Band B144",
      'gee:units': "unitless",
      center_wavelength:1.0985000134,
      full_width_half_max:0.0056605642,
      'gee:wavelength': "1098.5009nm, FWHM: 5.6606nm"
     },
     {
      name: "B145",
      description: "VNIR Band B145",
      'gee:units': "unitless",
      center_wavelength:1.1035100222,
      full_width_half_max:0.0056614634,
      'gee:wavelength': "1103.5095nm, FWHM: 5.6615nm"
     },
     {
      name: "B146",
      description: "VNIR Band B146",
      'gee:units': "unitless",
      center_wavelength:1.108520031,
      full_width_half_max:0.0056623775,
      'gee:wavelength': "1108.5182nm, FWHM: 5.6624nm"
     },
     {
      name: "B147",
      description: "VNIR Band B147",
      'gee:units': "unitless",
      center_wavelength:1.1135300398,
      full_width_half_max:0.0056633046,
      'gee:wavelength': "1113.527nm, FWHM: 5.6633nm"
     },
     {
      name: "B148",
      description: "VNIR Band B148",
      'gee:units': "unitless",
      center_wavelength:1.1185400486,
      full_width_half_max:0.0056642466,
      'gee:wavelength': "1118.5356nm, FWHM: 5.6642nm"
     },
     {
      name: "B149",
      description: "VNIR Band B149",
      'gee:units': "unitless",
      center_wavelength:1.1235400438,
      full_width_half_max:0.0056652036,
      'gee:wavelength': "1123.5443nm, FWHM: 5.6652nm"
     },
     {
      name: "B150",
      description: "VNIR Band B150",
      'gee:units': "unitless",
      center_wavelength:1.1285500526,
      full_width_half_max:0.0056661726,
      'gee:wavelength': "1128.553nm, FWHM: 5.6662nm"
     },
     {
      name: "B151",
      description: "VNIR Band B151",
      'gee:units': "unitless",
      center_wavelength:1.1335599422,
      full_width_half_max:0.005667157,
      'gee:wavelength': "1133.5616nm, FWHM: 5.6672nm"
     },
     {
      name: "B152",
      description: "VNIR Band B152",
      'gee:units': "unitless",
      center_wavelength:1.1385699511,
      full_width_half_max:0.0056681549,
      'gee:wavelength': "1138.5704nm, FWHM: 5.6682nm"
     },
     {
      name: "B153",
      description: "VNIR Band B153",
      'gee:units': "unitless",
      center_wavelength:1.1435799599,
      full_width_half_max:0.0056691663,
      'gee:wavelength': "1143.5791nm, FWHM: 5.6692nm"
     },
     {
      name: "B154",
      description: "VNIR Band B154",
      'gee:units': "unitless",
      center_wavelength:1.1485899687,
      full_width_half_max:0.0056701899,
      'gee:wavelength': "1148.5878nm, FWHM: 5.6702nm"
     },
     {
      name: "B155",
      description: "VNIR Band B155",
      'gee:units': "unitless",
      center_wavelength:1.1535999775,
      full_width_half_max:0.0056712292,
      'gee:wavelength': "1153.5964nm, FWHM: 5.6712nm"
     },
     {
      name: "B156",
      description: "VNIR Band B156",
      'gee:units': "unitless",
      center_wavelength:1.1586099863,
      full_width_half_max:0.0056722802,
      'gee:wavelength': "1158.6051nm, FWHM: 5.6723nm"
     },
     {
      name: "B157",
      description: "VNIR Band B157",
      'gee:units': "unitless",
      center_wavelength:1.1636099815,
      full_width_half_max:0.0056733489,
      'gee:wavelength': "1163.6138nm, FWHM: 5.6733nm"
     },
     {
      name: "B158",
      description: "VNIR Band B158",
      'gee:units': "unitless",
      center_wavelength:1.1686199903,
      full_width_half_max:0.0056744283,
      'gee:wavelength': "1168.6224nm, FWHM: 5.6744nm"
     },
     {
      name: "B159",
      description: "VNIR Band B159",
      'gee:units': "unitless",
      center_wavelength:1.1736299992,
      full_width_half_max:0.0056755231,
      'gee:wavelength': "1173.6312nm, FWHM: 5.6755nm"
     },
     {
      name: "B160",
      description: "VNIR Band B160",
      'gee:units': "unitless",
      center_wavelength:1.178640008,
      full_width_half_max:0.0056766323,
      'gee:wavelength': "1178.6398nm, FWHM: 5.6766nm"
     },
     {
      name: "B161",
      description: "VNIR Band B161",
      'gee:units': "unitless",
      center_wavelength:1.1836500168,
      full_width_half_max:0.0056777536,
      'gee:wavelength': "1183.6484nm, FWHM: 5.6778nm"
     },
     {
      name: "B162",
      description: "VNIR Band B162",
      'gee:units': "unitless",
      center_wavelength:1.1886600256,
      full_width_half_max:0.0056788893,
      'gee:wavelength': "1188.6571nm, FWHM: 5.6789nm"
     },
     {
      name: "B163",
      description: "VNIR Band B163",
      'gee:units': "unitless",
      center_wavelength:1.1936700344,
      full_width_half_max:0.0056800377,
      'gee:wavelength': "1193.6658nm, FWHM: 5.68nm"
     },
     {
      name: "B164",
      description: "VNIR Band B164",
      'gee:units': "unitless",
      center_wavelength:1.1986700296,
      full_width_half_max:0.0056812004,
      'gee:wavelength': "1198.6746nm, FWHM: 5.6812nm"
     },
     {
      name: "B165",
      description: "VNIR Band B165",
      'gee:units': "unitless",
      center_wavelength:1.2036800385,
      full_width_half_max:0.0056823771,
      'gee:wavelength': "1203.6833nm, FWHM: 5.6824nm"
     },
     {
      name: "B166",
      description: "VNIR Band B166",
      'gee:units': "unitless",
      center_wavelength:1.2086900473,
      full_width_half_max:0.0056835678,
      'gee:wavelength': "1208.692nm, FWHM: 5.6836nm"
     },
     {
      name: "B167",
      description: "VNIR Band B167",
      'gee:units': "unitless",
      center_wavelength:1.2137000561,
      full_width_half_max:0.005684772,
      'gee:wavelength': "1213.7006nm, FWHM: 5.6848nm"
     },
     {
      name: "B168",
      description: "VNIR Band B168",
      'gee:units': "unitless",
      center_wavelength:1.2187099457,
      full_width_half_max:0.0056859888,
      'gee:wavelength': "1218.7092nm, FWHM: 5.686nm"
     },
     {
      name: "B169",
      description: "VNIR Band B169",
      'gee:units': "unitless",
      center_wavelength:1.2237199545,
      full_width_half_max:0.0056872214,
      'gee:wavelength': "1223.718nm, FWHM: 5.6872nm"
     },
     {
      name: "B170",
      description: "VNIR Band B170",
      'gee:units': "unitless",
      center_wavelength:1.2287299633,
      full_width_half_max:0.0056884661,
      'gee:wavelength': "1228.7267nm, FWHM: 5.6885nm"
     },
     {
      name: "B171",
      description: "VNIR Band B171",
      'gee:units': "unitless",
      center_wavelength:1.2337399721,
      full_width_half_max:0.0056897253,
      'gee:wavelength': "1233.7355nm, FWHM: 5.6897nm"
     },
     {
      name: "B172",
      description: "VNIR Band B172",
      'gee:units': "unitless",
      center_wavelength:1.2387399673,
      full_width_half_max:0.0056909989,
      'gee:wavelength': "1238.7441nm, FWHM: 5.691nm"
     },
     {
      name: "B173",
      description: "VNIR Band B173",
      'gee:units': "unitless",
      center_wavelength:1.2437499762,
      full_width_half_max:0.0056922846,
      'gee:wavelength': "1243.7528nm, FWHM: 5.6923nm"
     },
     {
      name: "B174",
      description: "VNIR Band B174",
      'gee:units': "unitless",
      center_wavelength:1.248759985,
      full_width_half_max:0.0056935837,
      'gee:wavelength': "1248.7616nm, FWHM: 5.6936nm"
     },
     {
      name: "B175",
      description: "VNIR Band B175",
      'gee:units': "unitless",
      center_wavelength:1.2537699938,
      full_width_half_max:0.0056948964,
      'gee:wavelength': "1253.7703nm, FWHM: 5.6949nm"
     },
     {
      name: "B176",
      description: "VNIR Band B176",
      'gee:units': "unitless",
      center_wavelength:1.2587800026,
      full_width_half_max:0.0056962231,
      'gee:wavelength': "1258.7789nm, FWHM: 5.6962nm"
     },
     {
      name: "B177",
      description: "VNIR Band B177",
      'gee:units': "unitless",
      center_wavelength:1.2637900114,
      full_width_half_max:0.0056975642,
      'gee:wavelength': "1263.7875nm, FWHM: 5.6976nm"
     },
     {
      name: "B178",
      description: "VNIR Band B178",
      'gee:units': "unitless",
      center_wavelength:1.2688000202,
      full_width_half_max:0.0056989179,
      'gee:wavelength': "1268.7963nm, FWHM: 5.6989nm"
     },
     {
      name: "B179",
      description: "VNIR Band B179",
      'gee:units': "unitless",
      center_wavelength:1.2738000154,
      full_width_half_max:0.0057002869,
      'gee:wavelength': "1273.8049nm, FWHM: 5.7003nm"
     },
     {
      name: "B180",
      description: "VNIR Band B180",
      'gee:units': "unitless",
      center_wavelength:1.2788100243,
      full_width_half_max:0.0057016653,
      'gee:wavelength': "1278.8136nm, FWHM: 5.7017nm"
     },
     {
      name: "B181",
      description: "VNIR Band B181",
      'gee:units': "unitless",
      center_wavelength:1.2838200331,
      full_width_half_max:0.0057030614,
      'gee:wavelength': "1283.8223nm, FWHM: 5.7031nm"
     },
     {
      name: "B182",
      description: "VNIR Band B182",
      'gee:units': "unitless",
      center_wavelength:1.2888300419,
      full_width_half_max:0.00570447,
      'gee:wavelength': "1288.831nm, FWHM: 5.7045nm"
     },
     {
      name: "B183",
      description: "VNIR Band B183",
      'gee:units': "unitless",
      center_wavelength:1.2938400507,
      full_width_half_max:0.0057058902,
      'gee:wavelength': "1293.8397nm, FWHM: 5.7059nm"
     },
     {
      name: "B184",
      description: "VNIR Band B184",
      'gee:units': "unitless",
      center_wavelength:1.2988500595,
      full_width_half_max:0.0057073259,
      'gee:wavelength': "1298.8485nm, FWHM: 5.7073nm"
     },
     {
      name: "B185",
      description: "VNIR Band B185",
      'gee:units': "unitless",
      center_wavelength:1.3038599491,
      full_width_half_max:0.0057087746,
      'gee:wavelength': "1303.857nm, FWHM: 5.7088nm"
     },
     {
      name: "B186",
      description: "VNIR Band B186",
      'gee:units': "unitless",
      center_wavelength:1.3088699579,
      full_width_half_max:0.0057102367,
      'gee:wavelength': "1308.8656nm, FWHM: 5.7102nm"
     },
     {
      name: "B187",
      description: "VNIR Band B187",
      'gee:units': "unitless",
      center_wavelength:1.3138699532,
      full_width_half_max:0.0057117119,
      'gee:wavelength': "1313.8743nm, FWHM: 5.7117nm"
     },
     {
      name: "B188",
      description: "VNIR Band B188",
      'gee:units': "unitless",
      center_wavelength:1.318879962,
      full_width_half_max:0.0057132007,
      'gee:wavelength': "1318.8829nm, FWHM: 5.7132nm"
     },
     {
      name: "B189",
      description: "VNIR Band B189",
      'gee:units': "unitless",
      center_wavelength:1.3238899708,
      full_width_half_max:0.0057147038,
      'gee:wavelength': "1323.8917nm, FWHM: 5.7147nm"
     },
     {
      name: "B190",
      description: "VNIR Band B190",
      'gee:units': "unitless",
      center_wavelength:1.3288999796,
      full_width_half_max:0.00571622,
      'gee:wavelength': "1328.9004nm, FWHM: 5.7162nm"
     },
     {
      name: "B191",
      description: "VNIR Band B191",
      'gee:units': "unitless",
      center_wavelength:1.3339099884,
      full_width_half_max:0.0057177497,
      'gee:wavelength': "1333.909nm, FWHM: 5.7177nm"
     },
     {
      name: "B192",
      description: "VNIR Band B192",
      'gee:units': "unitless",
      center_wavelength:1.3389199972,
      full_width_half_max:0.005719292,
      'gee:wavelength': "1338.9178nm, FWHM: 5.7193nm"
     },
     {
      name: "B193",
      description: "VNIR Band B193",
      'gee:units': "unitless",
      center_wavelength:1.343930006,
      full_width_half_max:0.0057208482,
      'gee:wavelength': "1343.9265nm, FWHM: 5.7208nm"
     },
     {
      name: "B194",
      description: "VNIR Band B194",
      'gee:units': "unitless",
      center_wavelength:1.3489400148,
      full_width_half_max:0.0057224166,
      'gee:wavelength': "1348.9352nm, FWHM: 5.7224nm"
     },
     {
      name: "B195",
      description: "VNIR Band B195",
      'gee:units': "unitless",
      center_wavelength:1.3539400101,
      full_width_half_max:0.0057239998,
      'gee:wavelength': "1353.9437nm, FWHM: 5.724nm"
     },
     {
      name: "B196",
      description: "VNIR Band B196",
      'gee:units': "unitless",
      center_wavelength:1.3589500189,
      full_width_half_max:0.0057255961,
      'gee:wavelength': "1358.9528nm, FWHM: 5.7256nm"
     },
     {
      name: "B197",
      description: "VNIR Band B197",
      'gee:units': "unitless",
      center_wavelength:1.3639600277,
      full_width_half_max:0.0057272064,
      'gee:wavelength': "1363.9613nm, FWHM: 5.7272nm"
     },
     {
      name: "B198",
      description: "VNIR Band B198",
      'gee:units': "unitless",
      center_wavelength:1.3689700365,
      full_width_half_max:0.0057288287,
      'gee:wavelength': "1368.97nm, FWHM: 5.7288nm"
     },
     {
      name: "B199",
      description: "VNIR Band B199",
      'gee:units': "unitless",
      center_wavelength:1.3739800453,
      full_width_half_max:0.0057304651,
      'gee:wavelength': "1373.9788nm, FWHM: 5.7305nm"
     },
     {
      name: "B200",
      description: "VNIR Band B200",
      'gee:units': "unitless",
      center_wavelength:1.3789900541,
      full_width_half_max:0.0057321158,
      'gee:wavelength': "1378.9873nm, FWHM: 5.7321nm"
     },
     {
      name: "B201",
      description: "VNIR Band B201",
      'gee:units': "unitless",
      center_wavelength:1.3839999437,
      full_width_half_max:0.0057337787,
      'gee:wavelength': "1383.9961nm, FWHM: 5.7338nm"
     },
     {
      name: "B202",
      description: "VNIR Band B202",
      'gee:units': "unitless",
      center_wavelength:1.3890000582,
      full_width_half_max:0.0057354532,
      'gee:wavelength': "1389.0048nm, FWHM: 5.7355nm"
     },
     {
      name: "B203",
      description: "VNIR Band B203",
      'gee:units': "unitless",
      center_wavelength:1.3940099478,
      full_width_half_max:0.0057371417,
      'gee:wavelength': "1394.0135nm, FWHM: 5.7371nm"
     },
     {
      name: "B204",
      description: "VNIR Band B204",
      'gee:units': "unitless",
      center_wavelength:1.3990199566,
      full_width_half_max:0.0057388456,
      'gee:wavelength': "1399.0221nm, FWHM: 5.7388nm"
     },
     {
      name: "B205",
      description: "SWIR Band B205",
      'gee:units': "unitless",
      center_wavelength:1.4040299654,
      full_width_half_max:0.0057405615,
      'gee:wavelength': "1404.0309nm, FWHM: 5.7406nm"
     },
     {
      name: "B206",
      description: "SWIR Band B206",
      'gee:units': "unitless",
      center_wavelength:1.4090399742,
      full_width_half_max:0.0057422905,
      'gee:wavelength': "1409.0394nm, FWHM: 5.7423nm"
     },
     {
      name: "B207",
      description: "SWIR Band B207",
      'gee:units': "unitless",
      center_wavelength:1.414049983,
      full_width_half_max:0.005744033,
      'gee:wavelength': "1414.0481nm, FWHM: 5.744nm"
     },
     {
      name: "B208",
      description: "SWIR Band B208",
      'gee:units': "unitless",
      center_wavelength:1.4190599918,
      full_width_half_max:0.0057457881,
      'gee:wavelength': "1419.0569nm, FWHM: 5.7458nm"
     },
     {
      name: "B209",
      description: "SWIR Band B209",
      'gee:units': "unitless",
      center_wavelength:1.4240700006,
      full_width_half_max:0.0057475562,
      'gee:wavelength': "1424.0656nm, FWHM: 5.7476nm"
     },
     {
      name: "B210",
      description: "SWIR Band B210",
      'gee:units': "unitless",
      center_wavelength:1.4290699959,
      full_width_half_max:0.0057493392,
      'gee:wavelength': "1429.0742nm, FWHM: 5.7493nm"
     },
     {
      name: "B211",
      description: "SWIR Band B211",
      'gee:units': "unitless",
      center_wavelength:1.4340800047,
      full_width_half_max:0.005751133,
      'gee:wavelength': "1434.083nm, FWHM: 5.7511nm"
     },
     {
      name: "B212",
      description: "SWIR Band B212",
      'gee:units': "unitless",
      center_wavelength:1.4390900135,
      full_width_half_max:0.0057529416,
      'gee:wavelength': "1439.0917nm, FWHM: 5.7529nm"
     },
     {
      name: "B213",
      description: "SWIR Band B213",
      'gee:units': "unitless",
      center_wavelength:1.4441000223,
      full_width_half_max:0.0057547642,
      'gee:wavelength': "1444.1003nm, FWHM: 5.7548nm"
     },
     {
      name: "B214",
      description: "SWIR Band B214",
      'gee:units': "unitless",
      center_wavelength:1.4491100311,
      full_width_half_max:0.005756598,
      'gee:wavelength': "1449.1088nm, FWHM: 5.7566nm"
     },
     {
      name: "B215",
      description: "SWIR Band B215",
      'gee:units': "unitless",
      center_wavelength:1.4541200399,
      full_width_half_max:0.0057584471,
      'gee:wavelength': "1454.1174nm, FWHM: 5.7584nm"
     },
     {
      name: "B216",
      description: "SWIR Band B216",
      'gee:units': "unitless",
      center_wavelength:1.4591300488,
      full_width_half_max:0.0057603065,
      'gee:wavelength': "1459.1263nm, FWHM: 5.7603nm"
     },
     {
      name: "B217",
      description: "SWIR Band B217",
      'gee:units': "unitless",
      center_wavelength:1.4641400576,
      full_width_half_max:0.0057621817,
      'gee:wavelength': "1464.135nm, FWHM: 5.7622nm"
     },
     {
      name: "B218",
      description: "SWIR Band B218",
      'gee:units': "unitless",
      center_wavelength:1.4691400528,
      full_width_half_max:0.0057640676,
      'gee:wavelength': "1469.1436nm, FWHM: 5.7641nm"
     },
     {
      name: "B219",
      description: "SWIR Band B219",
      'gee:units': "unitless",
      center_wavelength:1.4741499424,
      full_width_half_max:0.0057659675,
      'gee:wavelength': "1474.1522nm, FWHM: 5.766nm"
     },
     {
      name: "B220",
      description: "SWIR Band B220",
      'gee:units': "unitless",
      center_wavelength:1.4791599512,
      full_width_half_max:0.00576788,
      'gee:wavelength': "1479.161nm, FWHM: 5.7679nm"
     },
     {
      name: "B221",
      description: "SWIR Band B221",
      'gee:units': "unitless",
      center_wavelength:1.48416996,
      full_width_half_max:0.0057698083,
      'gee:wavelength': "1484.1697nm, FWHM: 5.7698nm"
     },
     {
      name: "B222",
      description: "SWIR Band B222",
      'gee:units': "unitless",
      center_wavelength:1.4891799688,
      full_width_half_max:0.0057717473,
      'gee:wavelength': "1489.1785nm, FWHM: 5.7717nm"
     },
     {
      name: "B223",
      description: "SWIR Band B223",
      'gee:units': "unitless",
      center_wavelength:1.4941899776,
      full_width_half_max:0.005773698,
      'gee:wavelength': "1494.1871nm, FWHM: 5.7737nm"
     },
     {
      name: "B224",
      description: "SWIR Band B224",
      'gee:units': "unitless",
      center_wavelength:1.4991999865,
      full_width_half_max:0.0057756626,
      'gee:wavelength': "1499.1959nm, FWHM: 5.7757nm"
     },
     {
      name: "B225",
      description: "SWIR Band B225",
      'gee:units': "unitless",
      center_wavelength:1.5041999817,
      full_width_half_max:0.0057776417,
      'gee:wavelength': "1504.2045nm, FWHM: 5.7776nm"
     },
     {
      name: "B226",
      description: "SWIR Band B226",
      'gee:units': "unitless",
      center_wavelength:1.5092099905,
      full_width_half_max:0.0057796333,
      'gee:wavelength': "1509.2135nm, FWHM: 5.7796nm"
     },
     {
      name: "B227",
      description: "SWIR Band B227",
      'gee:units': "unitless",
      center_wavelength:1.5142199993,
      full_width_half_max:0.005781638,
      'gee:wavelength': "1514.2219nm, FWHM: 5.7816nm"
     },
     {
      name: "B228",
      description: "SWIR Band B228",
      'gee:units': "unitless",
      center_wavelength:1.5192300081,
      full_width_half_max:0.0057836557,
      'gee:wavelength': "1519.2306nm, FWHM: 5.7837nm"
     },
     {
      name: "B229",
      description: "SWIR Band B229",
      'gee:units': "unitless",
      center_wavelength:1.5242400169,
      full_width_half_max:0.005785685,
      'gee:wavelength': "1524.2394nm, FWHM: 5.7857nm"
     },
     {
      name: "B230",
      description: "SWIR Band B230",
      'gee:units': "unitless",
      center_wavelength:1.5292500257,
      full_width_half_max:0.0057877274,
      'gee:wavelength': "1529.2479nm, FWHM: 5.7877nm"
     },
     {
      name: "B231",
      description: "SWIR Band B231",
      'gee:units': "unitless",
      center_wavelength:1.5342600346,
      full_width_half_max:0.0057897838,
      'gee:wavelength': "1534.2566nm, FWHM: 5.7898nm"
     },
     {
      name: "B232",
      description: "SWIR Band B232",
      'gee:units': "unitless",
      center_wavelength:1.5392700434,
      full_width_half_max:0.0057918546,
      'gee:wavelength': "1539.2654nm, FWHM: 5.7919nm"
     },
     {
      name: "B233",
      description: "SWIR Band B233",
      'gee:units': "unitless",
      center_wavelength:1.5442700386,
      full_width_half_max:0.0057939352,
      'gee:wavelength': "1544.2742nm, FWHM: 5.7939nm"
     },
     {
      name: "B234",
      description: "SWIR Band B234",
      'gee:units': "unitless",
      center_wavelength:1.5492800474,
      full_width_half_max:0.0057960316,
      'gee:wavelength': "1549.2828nm, FWHM: 5.796nm"
     },
     {
      name: "B235",
      description: "SWIR Band B235",
      'gee:units': "unitless",
      center_wavelength:1.5542900562,
      full_width_half_max:0.0057981373,
      'gee:wavelength': "1554.2914nm, FWHM: 5.7981nm"
     },
     {
      name: "B236",
      description: "SWIR Band B236",
      'gee:units': "unitless",
      center_wavelength:1.5592999458,
      full_width_half_max:0.0058002602,
      'gee:wavelength': "1559.3nm, FWHM: 5.8003nm"
     },
     {
      name: "B237",
      description: "SWIR Band B237",
      'gee:units': "unitless",
      center_wavelength:1.5643099546,
      full_width_half_max:0.0058023934,
      'gee:wavelength': "1564.3088nm, FWHM: 5.8024nm"
     },
     {
      name: "B238",
      description: "SWIR Band B238",
      'gee:units': "unitless",
      center_wavelength:1.5693199635,
      full_width_half_max:0.0058045392,
      'gee:wavelength': "1569.3175nm, FWHM: 5.8045nm"
     },
     {
      name: "B239",
      description: "SWIR Band B239",
      'gee:units': "unitless",
      center_wavelength:1.5743299723,
      full_width_half_max:0.005806698,
      'gee:wavelength': "1574.326nm, FWHM: 5.8067nm"
     },
     {
      name: "B240",
      description: "SWIR Band B240",
      'gee:units': "unitless",
      center_wavelength:1.5793299675,
      full_width_half_max:0.0058088689,
      'gee:wavelength': "1579.3348nm, FWHM: 5.8089nm"
     },
     {
      name: "B241",
      description: "SWIR Band B241",
      'gee:units': "unitless",
      center_wavelength:1.5843399763,
      full_width_half_max:0.0058110543,
      'gee:wavelength': "1584.3436nm, FWHM: 5.8111nm"
     },
     {
      name: "B242",
      description: "SWIR Band B242",
      'gee:units': "unitless",
      center_wavelength:1.5893499851,
      full_width_half_max:0.0058132526,
      'gee:wavelength': "1589.3522nm, FWHM: 5.8133nm"
     },
     {
      name: "B243",
      description: "SWIR Band B243",
      'gee:units': "unitless",
      center_wavelength:1.5943599939,
      full_width_half_max:0.005815465,
      'gee:wavelength': "1594.361nm, FWHM: 5.8155nm"
     },
     {
      name: "B244",
      description: "SWIR Band B244",
      'gee:units': "unitless",
      center_wavelength:1.5993700027,
      full_width_half_max:0.0058176871,
      'gee:wavelength': "1599.3695nm, FWHM: 5.8177nm"
     },
     {
      name: "B245",
      description: "SWIR Band B245",
      'gee:units': "unitless",
      center_wavelength:1.6043800116,
      full_width_half_max:0.0058199237,
      'gee:wavelength': "1604.3783nm, FWHM: 5.8199nm"
     },
     {
      name: "B246",
      description: "SWIR Band B246",
      'gee:units': "unitless",
      center_wavelength:1.6093900204,
      full_width_half_max:0.0058221733,
      'gee:wavelength': "1609.387nm, FWHM: 5.8222nm"
     },
     {
      name: "B247",
      description: "SWIR Band B247",
      'gee:units': "unitless",
      center_wavelength:1.6144000292,
      full_width_half_max:0.0058244346,
      'gee:wavelength': "1614.3956nm, FWHM: 5.8244nm"
     },
     {
      name: "B248",
      description: "SWIR Band B248",
      'gee:units': "unitless",
      center_wavelength:1.6194000244,
      full_width_half_max:0.0058267093,
      'gee:wavelength': "1619.4043nm, FWHM: 5.8267nm"
     },
     {
      name: "B249",
      description: "SWIR Band B249",
      'gee:units': "unitless",
      center_wavelength:1.6244100332,
      full_width_half_max:0.0058289957,
      'gee:wavelength': "1624.413nm, FWHM: 5.829nm"
     },
     {
      name: "B250",
      description: "SWIR Band B250",
      'gee:units': "unitless",
      center_wavelength:1.629420042,
      full_width_half_max:0.0058312952,
      'gee:wavelength': "1629.4215nm, FWHM: 5.8313nm"
     },
     {
      name: "B251",
      description: "SWIR Band B251",
      'gee:units': "unitless",
      center_wavelength:1.6344300508,
      full_width_half_max:0.0058336081,
      'gee:wavelength': "1634.4303nm, FWHM: 5.8336nm"
     },
     {
      name: "B252",
      description: "SWIR Band B252",
      'gee:units': "unitless",
      center_wavelength:1.6394399405,
      full_width_half_max:0.0058359336,
      'gee:wavelength': "1639.4388nm, FWHM: 5.8359nm"
     },
     {
      name: "B253",
      description: "SWIR Band B253",
      'gee:units': "unitless",
      center_wavelength:1.6444499493,
      full_width_half_max:0.0058382717,
      'gee:wavelength': "1644.4475nm, FWHM: 5.8383nm"
     },
     {
      name: "B254",
      description: "SWIR Band B254",
      'gee:units': "unitless",
      center_wavelength:1.6494599581,
      full_width_half_max:0.0058406233,
      'gee:wavelength': "1649.4563nm, FWHM: 5.8406nm"
     },
     {
      name: "B255",
      description: "SWIR Band B255",
      'gee:units': "unitless",
      center_wavelength:1.6544599533,
      full_width_half_max:0.005842987,
      'gee:wavelength': "1654.465nm, FWHM: 5.843nm"
     },
     {
      name: "B256",
      description: "SWIR Band B256",
      'gee:units': "unitless",
      center_wavelength:1.6594699621,
      full_width_half_max:0.0058453633,
      'gee:wavelength': "1659.4736nm, FWHM: 5.8454nm"
     },
     {
      name: "B257",
      description: "SWIR Band B257",
      'gee:units': "unitless",
      center_wavelength:1.6644799709,
      full_width_half_max:0.0058477516,
      'gee:wavelength': "1664.4824nm, FWHM: 5.8478nm"
     },
     {
      name: "B258",
      description: "SWIR Band B258",
      'gee:units': "unitless",
      center_wavelength:1.6694899797,
      full_width_half_max:0.0058501535,
      'gee:wavelength': "1669.4911nm, FWHM: 5.8502nm"
     },
     {
      name: "B259",
      description: "SWIR Band B259",
      'gee:units': "unitless",
      center_wavelength:1.6744999886,
      full_width_half_max:0.0058525661,
      'gee:wavelength': "1674.5nm, FWHM: 5.8526nm"
     },
     {
      name: "B260",
      description: "SWIR Band B260",
      'gee:units': "unitless",
      center_wavelength:1.6795099974,
      full_width_half_max:0.005854995,
      'gee:wavelength': "1679.5085nm, FWHM: 5.855nm"
     },
     {
      name: "B261",
      description: "SWIR Band B261",
      'gee:units': "unitless",
      center_wavelength:1.6845200062,
      full_width_half_max:0.0058574318,
      'gee:wavelength': "1684.5175nm, FWHM: 5.8574nm"
     },
     {
      name: "B262",
      description: "SWIR Band B262",
      'gee:units': "unitless",
      center_wavelength:1.689530015,
      full_width_half_max:0.0058598858,
      'gee:wavelength': "1689.526nm, FWHM: 5.8599nm"
     },
     {
      name: "B263",
      description: "SWIR Band B263",
      'gee:units': "unitless",
      center_wavelength:1.6945300102,
      full_width_half_max:0.0058623496,
      'gee:wavelength': "1694.5345nm, FWHM: 5.8623nm"
     },
     {
      name: "B264",
      description: "SWIR Band B264",
      'gee:units': "unitless",
      center_wavelength:1.699540019,
      full_width_half_max:0.0058648265,
      'gee:wavelength': "1699.5432nm, FWHM: 5.8648nm"
     },
     {
      name: "B265",
      description: "SWIR Band B265",
      'gee:units': "unitless",
      center_wavelength:1.7045500278,
      full_width_half_max:0.0058673169,
      'gee:wavelength': "1704.5518nm, FWHM: 5.8673nm"
     },
     {
      name: "B266",
      description: "SWIR Band B266",
      'gee:units': "unitless",
      center_wavelength:1.7095600367,
      full_width_half_max:0.0058698198,
      'gee:wavelength': "1709.5605nm, FWHM: 5.8698nm"
     },
     {
      name: "B267",
      description: "SWIR Band B267",
      'gee:units': "unitless",
      center_wavelength:1.7145700455,
      full_width_half_max:0.005872333,
      'gee:wavelength': "1714.5692nm, FWHM: 5.8723nm"
     },
     {
      name: "B268",
      description: "SWIR Band B268",
      'gee:units': "unitless",
      center_wavelength:1.7195800543,
      full_width_half_max:0.0058748601,
      'gee:wavelength': "1719.578nm, FWHM: 5.8749nm"
     },
     {
      name: "B269",
      description: "SWIR Band B269",
      'gee:units': "unitless",
      center_wavelength:1.7245899439,
      full_width_half_max:0.0058774026,
      'gee:wavelength': "1724.5868nm, FWHM: 5.8774nm"
     },
     {
      name: "B270",
      description: "SWIR Band B270",
      'gee:units': "unitless",
      center_wavelength:1.7295999527,
      full_width_half_max:0.0058799549,
      'gee:wavelength': "1729.5955nm, FWHM: 5.88nm"
     },
     {
      name: "B271",
      description: "SWIR Band B271",
      'gee:units': "unitless",
      center_wavelength:1.7345999479,
      full_width_half_max:0.0058825198,
      'gee:wavelength': "1734.6042nm, FWHM: 5.8825nm"
     },
     {
      name: "B272",
      description: "SWIR Band B272",
      'gee:units': "unitless",
      center_wavelength:1.7396099567,
      full_width_half_max:0.0058850977,
      'gee:wavelength': "1739.613nm, FWHM: 5.8851nm"
     },
     {
      name: "B273",
      description: "SWIR Band B273",
      'gee:units': "unitless",
      center_wavelength:1.7446199656,
      full_width_half_max:0.0058876877,
      'gee:wavelength': "1744.6215nm, FWHM: 5.8877nm"
     },
     {
      name: "B274",
      description: "SWIR Band B274",
      'gee:units': "unitless",
      center_wavelength:1.7496299744,
      full_width_half_max:0.0058902898,
      'gee:wavelength': "1749.6302nm, FWHM: 5.8903nm"
     },
     {
      name: "B275",
      description: "SWIR Band B275",
      'gee:units': "unitless",
      center_wavelength:1.7546399832,
      full_width_half_max:0.0058929059,
      'gee:wavelength': "1754.6388nm, FWHM: 5.8929nm"
     },
     {
      name: "B276",
      description: "SWIR Band B276",
      'gee:units': "unitless",
      center_wavelength:1.759649992,
      full_width_half_max:0.0058955336,
      'gee:wavelength': "1759.6476nm, FWHM: 5.8955nm"
     },
     {
      name: "B277",
      description: "SWIR Band B277",
      'gee:units': "unitless",
      center_wavelength:1.7646600008,
      full_width_half_max:0.005898172,
      'gee:wavelength': "1764.6562nm, FWHM: 5.8982nm"
     },
     {
      name: "B278",
      description: "SWIR Band B278",
      'gee:units': "unitless",
      center_wavelength:1.769659996,
      full_width_half_max:0.0059008258,
      'gee:wavelength': "1769.665nm, FWHM: 5.9008nm"
     },
     {
      name: "B279",
      description: "SWIR Band B279",
      'gee:units': "unitless",
      center_wavelength:1.7746700048,
      full_width_half_max:0.0059034913,
      'gee:wavelength': "1774.6738nm, FWHM: 5.9035nm"
     },
     {
      name: "B280",
      description: "SWIR Band B280",
      'gee:units': "unitless",
      center_wavelength:1.7796800137,
      full_width_half_max:0.0059061688,
      'gee:wavelength': "1779.6824nm, FWHM: 5.9062nm"
     },
     {
      name: "B281",
      description: "SWIR Band B281",
      'gee:units': "unitless",
      center_wavelength:1.7846900225,
      full_width_half_max:0.005908859,
      'gee:wavelength': "1784.691nm, FWHM: 5.9089nm"
     },
     {
      name: "B282",
      description: "SWIR Band B282",
      'gee:units': "unitless",
      center_wavelength:1.7897000313,
      full_width_half_max:0.0059115617,
      'gee:wavelength': "1789.6996nm, FWHM: 5.9116nm"
     },
     {
      name: "B283",
      description: "SWIR Band B283",
      'gee:units': "unitless",
      center_wavelength:1.7947100401,
      full_width_half_max:0.0059142769,
      'gee:wavelength': "1794.7083nm, FWHM: 5.9143nm"
     },
     {
      name: "B284",
      description: "SWIR Band B284",
      'gee:units': "unitless",
      center_wavelength:1.7997200489,
      full_width_half_max:0.0059170043,
      'gee:wavelength': "1799.717nm, FWHM: 5.917nm"
     },
     {
      name: "B285",
      description: "SWIR Band B285",
      'gee:units': "unitless",
      center_wavelength:1.8047300577,
      full_width_half_max:0.0059197433,
      'gee:wavelength': "1804.7256nm, FWHM: 5.9197nm"
     },
     {
      name: "B286",
      description: "SWIR Band B286",
      'gee:units': "unitless",
      center_wavelength:1.8097300529,
      full_width_half_max:0.0059224945,
      'gee:wavelength': "1809.7343nm, FWHM: 5.9225nm"
     },
     {
      name: "B287",
      description: "SWIR Band B287",
      'gee:units': "unitless",
      center_wavelength:1.8147399426,
      full_width_half_max:0.00592526,
      'gee:wavelength': "1814.7432nm, FWHM: 5.9253nm"
     },
     {
      name: "B288",
      description: "SWIR Band B288",
      'gee:units': "unitless",
      center_wavelength:1.8197499514,
      full_width_half_max:0.0059280372,
      'gee:wavelength': "1819.752nm, FWHM: 5.928nm"
     },
     {
      name: "B289",
      description: "SWIR Band B289",
      'gee:units': "unitless",
      center_wavelength:1.8247599602,
      full_width_half_max:0.0059308256,
      'gee:wavelength': "1824.7604nm, FWHM: 5.9308nm"
     },
     {
      name: "B290",
      description: "SWIR Band B290",
      'gee:units': "unitless",
      center_wavelength:1.829769969,
      full_width_half_max:0.0059336284,
      'gee:wavelength': "1829.7692nm, FWHM: 5.9336nm"
     },
     {
      name: "B291",
      description: "SWIR Band B291",
      'gee:units': "unitless",
      center_wavelength:1.8347799778,
      full_width_half_max:0.0059364401,
      'gee:wavelength': "1834.778nm, FWHM: 5.9364nm"
     },
     {
      name: "B292",
      description: "SWIR Band B292",
      'gee:units': "unitless",
      center_wavelength:1.8397899866,
      full_width_half_max:0.0059392694,
      'gee:wavelength': "1839.7864nm, FWHM: 5.9393nm"
     },
     {
      name: "B293",
      description: "SWIR Band B293",
      'gee:units': "unitless",
      center_wavelength:1.8447999954,
      full_width_half_max:0.0059421072,
      'gee:wavelength': "1844.7952nm, FWHM: 5.9421nm"
     },
     {
      name: "B294",
      description: "SWIR Band B294",
      'gee:units': "unitless",
      center_wavelength:1.8497999907,
      full_width_half_max:0.005944958,
      'gee:wavelength': "1849.8038nm, FWHM: 5.945nm"
     },
     {
      name: "B295",
      description: "SWIR Band B295",
      'gee:units': "unitless",
      center_wavelength:1.8548099995,
      full_width_half_max:0.0059478213,
      'gee:wavelength': "1854.8124nm, FWHM: 5.9478nm"
     },
     {
      name: "B296",
      description: "SWIR Band B296",
      'gee:units': "unitless",
      center_wavelength:1.8598200083,
      full_width_half_max:0.0059506972,
      'gee:wavelength': "1859.8214nm, FWHM: 5.9507nm"
     },
     {
      name: "B297",
      description: "SWIR Band B297",
      'gee:units': "unitless",
      center_wavelength:1.8648300171,
      full_width_half_max:0.0059535862,
      'gee:wavelength': "1864.83nm, FWHM: 5.9536nm"
     },
     {
      name: "B298",
      description: "SWIR Band B298",
      'gee:units': "unitless",
      center_wavelength:1.8698400259,
      full_width_half_max:0.0059564863,
      'gee:wavelength': "1869.8387nm, FWHM: 5.9565nm"
     },
     {
      name: "B299",
      description: "SWIR Band B299",
      'gee:units': "unitless",
      center_wavelength:1.8748500347,
      full_width_half_max:0.0059593986,
      'gee:wavelength': "1874.8474nm, FWHM: 5.9594nm"
     },
     {
      name: "B300",
      description: "SWIR Band B300",
      'gee:units': "unitless",
      center_wavelength:1.8798600435,
      full_width_half_max:0.0059623253,
      'gee:wavelength': "1879.8562nm, FWHM: 5.9623nm"
     },
     {
      name: "B301",
      description: "SWIR Band B301",
      'gee:units': "unitless",
      center_wavelength:1.8848600388,
      full_width_half_max:0.0059652594,
      'gee:wavelength': "1884.8646nm, FWHM: 5.9653nm"
     },
     {
      name: "B302",
      description: "SWIR Band B302",
      'gee:units': "unitless",
      center_wavelength:1.8898700476,
      full_width_half_max:0.0059682117,
      'gee:wavelength': "1889.8734nm, FWHM: 5.9682nm"
     },
     {
      name: "B303",
      description: "SWIR Band B303",
      'gee:units': "unitless",
      center_wavelength:1.8948800564,
      full_width_half_max:0.0059711724,
      'gee:wavelength': "1894.882nm, FWHM: 5.9712nm"
     },
     {
      name: "B304",
      description: "SWIR Band B304",
      'gee:units': "unitless",
      center_wavelength:1.899889946,
      full_width_half_max:0.0059741489,
      'gee:wavelength': "1899.8907nm, FWHM: 5.9741nm"
     },
     {
      name: "B305",
      description: "SWIR Band B305",
      'gee:units': "unitless",
      center_wavelength:1.9048999548,
      full_width_half_max:0.0059771342,
      'gee:wavelength': "1904.8997nm, FWHM: 5.9771nm"
     },
     {
      name: "B306",
      description: "SWIR Band B306",
      'gee:units': "unitless",
      center_wavelength:1.9099099636,
      full_width_half_max:0.0059801321,
      'gee:wavelength': "1909.9082nm, FWHM: 5.9801nm"
     },
     {
      name: "B307",
      description: "SWIR Band B307",
      'gee:units': "unitless",
      center_wavelength:1.9149199724,
      full_width_half_max:0.0059831459,
      'gee:wavelength': "1914.9167nm, FWHM: 5.9831nm"
     },
     {
      name: "B308",
      description: "SWIR Band B308",
      'gee:units': "unitless",
      center_wavelength:1.9199299812,
      full_width_half_max:0.0059861708,
      'gee:wavelength': "1919.9257nm, FWHM: 5.9862nm"
     },
     {
      name: "B309",
      description: "SWIR Band B309",
      'gee:units': "unitless",
      center_wavelength:1.9249299765,
      full_width_half_max:0.0059892042,
      'gee:wavelength': "1924.9344nm, FWHM: 5.9892nm"
     },
     {
      name: "B310",
      description: "SWIR Band B310",
      'gee:units': "unitless",
      center_wavelength:1.9299399853,
      full_width_half_max:0.0059922524,
      'gee:wavelength': "1929.9427nm, FWHM: 5.9923nm"
     },
     {
      name: "B311",
      description: "SWIR Band B311",
      'gee:units': "unitless",
      center_wavelength:1.9349499941,
      full_width_half_max:0.0059953122,
      'gee:wavelength': "1934.9517nm, FWHM: 5.9953nm"
     },
     {
      name: "B312",
      description: "SWIR Band B312",
      'gee:units': "unitless",
      center_wavelength:1.9399600029,
      full_width_half_max:0.0059983842,
      'gee:wavelength': "1939.9604nm, FWHM: 5.9984nm"
     },
     {
      name: "B313",
      description: "SWIR Band B313",
      'gee:units': "unitless",
      center_wavelength:1.9449700117,
      full_width_half_max:0.0060014701,
      'gee:wavelength': "1944.9688nm, FWHM: 6.0015nm"
     },
     {
      name: "B314",
      description: "SWIR Band B314",
      'gee:units': "unitless",
      center_wavelength:1.9499800205,
      full_width_half_max:0.0060045663,
      'gee:wavelength': "1949.9775nm, FWHM: 6.0046nm"
     },
     {
      name: "B315",
      description: "SWIR Band B315",
      'gee:units': "unitless",
      center_wavelength:1.9549900293,
      full_width_half_max:0.0060076765,
      'gee:wavelength': "1954.9865nm, FWHM: 6.0077nm"
     },
     {
      name: "B316",
      description: "SWIR Band B316",
      'gee:units': "unitless",
      center_wavelength:1.9600000381,
      full_width_half_max:0.0060107978,
      'gee:wavelength': "1959.995nm, FWHM: 6.0108nm"
     },
     {
      name: "B317",
      description: "SWIR Band B317",
      'gee:units': "unitless",
      center_wavelength:1.9650000334,
      full_width_half_max:0.0060139317,
      'gee:wavelength': "1965.0035nm, FWHM: 6.0139nm"
     },
     {
      name: "B318",
      description: "SWIR Band B318",
      'gee:units': "unitless",
      center_wavelength:1.9700100422,
      full_width_half_max:0.0060170786,
      'gee:wavelength': "1970.0125nm, FWHM: 6.0171nm"
     },
     {
      name: "B319",
      description: "SWIR Band B319",
      'gee:units': "unitless",
      center_wavelength:1.975020051,
      full_width_half_max:0.0060202368,
      'gee:wavelength': "1975.0208nm, FWHM: 6.0202nm"
     },
     {
      name: "B320",
      description: "SWIR Band B320",
      'gee:units': "unitless",
      center_wavelength:1.9800299406,
      full_width_half_max:0.006023407,
      'gee:wavelength': "1980.0295nm, FWHM: 6.0234nm"
     },
     {
      name: "B321",
      description: "SWIR Band B321",
      'gee:units': "unitless",
      center_wavelength:1.9850399494,
      full_width_half_max:0.0060265884,
      'gee:wavelength': "1985.0385nm, FWHM: 6.0266nm"
     },
     {
      name: "B322",
      description: "SWIR Band B322",
      'gee:units': "unitless",
      center_wavelength:1.9900499582,
      full_width_half_max:0.0060297828,
      'gee:wavelength': "1990.047nm, FWHM: 6.0298nm"
     },
     {
      name: "B323",
      description: "SWIR Band B323",
      'gee:units': "unitless",
      center_wavelength:1.995059967,
      full_width_half_max:0.0060329908,
      'gee:wavelength': "1995.0558nm, FWHM: 6.033nm"
     },
     {
      name: "B324",
      description: "SWIR Band B324",
      'gee:units': "unitless",
      center_wavelength:2.0000600815,
      full_width_half_max:0.0060362089,
      'gee:wavelength': "2000.0645nm, FWHM: 6.0362nm"
     },
     {
      name: "B325",
      description: "SWIR Band B325",
      'gee:units': "unitless",
      center_wavelength:2.0050699711,
      full_width_half_max:0.006039443,
      'gee:wavelength': "2005.0732nm, FWHM: 6.0394nm"
     },
     {
      name: "B326",
      description: "SWIR Band B326",
      'gee:units': "unitless",
      center_wavelength:2.0100800991,
      full_width_half_max:0.0060426835,
      'gee:wavelength': "2010.082nm, FWHM: 6.0427nm"
     },
     {
      name: "B327",
      description: "SWIR Band B327",
      'gee:units': "unitless",
      center_wavelength:2.0150899887,
      full_width_half_max:0.0060459413,
      'gee:wavelength': "2015.0906nm, FWHM: 6.0459nm"
     },
     {
      name: "B328",
      description: "SWIR Band B328",
      'gee:units': "unitless",
      center_wavelength:2.0201001167,
      full_width_half_max:0.0060492097,
      'gee:wavelength': "2020.0992nm, FWHM: 6.0492nm"
     },
     {
      name: "B329",
      description: "SWIR Band B329",
      'gee:units': "unitless",
      center_wavelength:2.0251100063,
      full_width_half_max:0.0060524908,
      'gee:wavelength': "2025.1078nm, FWHM: 6.0525nm"
     },
     {
      name: "B330",
      description: "SWIR Band B330",
      'gee:units': "unitless",
      center_wavelength:2.0301198959,
      full_width_half_max:0.0060557825,
      'gee:wavelength': "2030.1165nm, FWHM: 6.0558nm"
     },
     {
      name: "B331",
      description: "SWIR Band B331",
      'gee:units': "unitless",
      center_wavelength:2.0351200104,
      full_width_half_max:0.006059086,
      'gee:wavelength': "2035.1252nm, FWHM: 6.0591nm"
     },
     {
      name: "B332",
      description: "SWIR Band B332",
      'gee:units': "unitless",
      center_wavelength:2.0401299,
      full_width_half_max:0.0060624047,
      'gee:wavelength': "2040.134nm, FWHM: 6.0624nm"
     },
     {
      name: "B333",
      description: "SWIR Band B333",
      'gee:units': "unitless",
      center_wavelength:2.045140028,
      full_width_half_max:0.0060657342,
      'gee:wavelength': "2045.1428nm, FWHM: 6.0657nm"
     },
     {
      name: "B334",
      description: "SWIR Band B334",
      'gee:units': "unitless",
      center_wavelength:2.0501499176,
      full_width_half_max:0.0060690753,
      'gee:wavelength': "2050.1516nm, FWHM: 6.0691nm"
     },
     {
      name: "B335",
      description: "SWIR Band B335",
      'gee:units': "unitless",
      center_wavelength:2.0551600456,
      full_width_half_max:0.0060724271,
      'gee:wavelength': "2055.16nm, FWHM: 6.0724nm"
     },
     {
      name: "B336",
      description: "SWIR Band B336",
      'gee:units': "unitless",
      center_wavelength:2.0601699352,
      full_width_half_max:0.0060757934,
      'gee:wavelength': "2060.1687nm, FWHM: 6.0758nm"
     },
     {
      name: "B337",
      description: "SWIR Band B337",
      'gee:units': "unitless",
      center_wavelength:2.0651800632,
      full_width_half_max:0.0060791709,
      'gee:wavelength': "2065.1772nm, FWHM: 6.0792nm"
     },
     {
      name: "B338",
      description: "SWIR Band B338",
      'gee:units': "unitless",
      center_wavelength:2.0701899529,
      full_width_half_max:0.0060825618,
      'gee:wavelength': "2070.186nm, FWHM: 6.0826nm"
     },
     {
      name: "B339",
      description: "SWIR Band B339",
      'gee:units': "unitless",
      center_wavelength:2.0751900673,
      full_width_half_max:0.0060859644,
      'gee:wavelength': "2075.1948nm, FWHM: 6.086nm"
     },
     {
      name: "B340",
      description: "SWIR Band B340",
      'gee:units': "unitless",
      center_wavelength:2.0801999569,
      full_width_half_max:0.0060893777,
      'gee:wavelength': "2080.2034nm, FWHM: 6.0894nm"
     },
     {
      name: "B341",
      description: "SWIR Band B341",
      'gee:units': "unitless",
      center_wavelength:2.0852100849,
      full_width_half_max:0.0060928054,
      'gee:wavelength': "2085.2122nm, FWHM: 6.0928nm"
     },
     {
      name: "B342",
      description: "SWIR Band B342",
      'gee:units': "unitless",
      center_wavelength:2.0902199745,
      full_width_half_max:0.0060962425,
      'gee:wavelength': "2090.221nm, FWHM: 6.0962nm"
     },
     {
      name: "B343",
      description: "SWIR Band B343",
      'gee:units': "unitless",
      center_wavelength:2.0952301025,
      full_width_half_max:0.0060996944,
      'gee:wavelength': "2095.2295nm, FWHM: 6.0997nm"
     },
     {
      name: "B344",
      description: "SWIR Band B344",
      'gee:units': "unitless",
      center_wavelength:2.1002399921,
      full_width_half_max:0.0061031575,
      'gee:wavelength': "2100.2383nm, FWHM: 6.1032nm"
     },
     {
      name: "B345",
      description: "SWIR Band B345",
      'gee:units': "unitless",
      center_wavelength:2.1052498817,
      full_width_half_max:0.0061066337,
      'gee:wavelength': "2105.2466nm, FWHM: 6.1066nm"
     },
     {
      name: "B346",
      description: "SWIR Band B346",
      'gee:units': "unitless",
      center_wavelength:2.1102600098,
      full_width_half_max:0.0061101215,
      'gee:wavelength': "2110.2556nm, FWHM: 6.1101nm"
     },
     {
      name: "B347",
      description: "SWIR Band B347",
      'gee:units': "unitless",
      center_wavelength:2.1152598858,
      full_width_half_max:0.0061136214,
      'gee:wavelength': "2115.2642nm, FWHM: 6.1136nm"
     },
     {
      name: "B348",
      description: "SWIR Band B348",
      'gee:units': "unitless",
      center_wavelength:2.1202700138,
      full_width_half_max:0.0061171311,
      'gee:wavelength': "2120.273nm, FWHM: 6.1171nm"
     },
     {
      name: "B349",
      description: "SWIR Band B349",
      'gee:units': "unitless",
      center_wavelength:2.1252799034,
      full_width_half_max:0.006120658,
      'gee:wavelength': "2125.2817nm, FWHM: 6.1207nm"
     },
     {
      name: "B350",
      description: "SWIR Band B350",
      'gee:units': "unitless",
      center_wavelength:2.1302900314,
      full_width_half_max:0.0061241942,
      'gee:wavelength': "2130.2903nm, FWHM: 6.1242nm"
     },
     {
      name: "B351",
      description: "SWIR Band B351",
      'gee:units': "unitless",
      center_wavelength:2.135299921,
      full_width_half_max:0.0061277421,
      'gee:wavelength': "2135.299nm, FWHM: 6.1277nm"
     },
     {
      name: "B352",
      description: "SWIR Band B352",
      'gee:units': "unitless",
      center_wavelength:2.1403100491,
      full_width_half_max:0.0061313026,
      'gee:wavelength': "2140.3079nm, FWHM: 6.1313nm"
     },
     {
      name: "B353",
      description: "SWIR Band B353",
      'gee:units': "unitless",
      center_wavelength:2.1453199387,
      full_width_half_max:0.0061348779,
      'gee:wavelength': "2145.3164nm, FWHM: 6.1349nm"
     },
     {
      name: "B354",
      description: "SWIR Band B354",
      'gee:units': "unitless",
      center_wavelength:2.1503200531,
      full_width_half_max:0.0061384621,
      'gee:wavelength': "2150.325nm, FWHM: 6.1385nm"
     },
     {
      name: "B355",
      description: "SWIR Band B355",
      'gee:units': "unitless",
      center_wavelength:2.1553299427,
      full_width_half_max:0.0061420589,
      'gee:wavelength': "2155.3337nm, FWHM: 6.1421nm"
     },
     {
      name: "B356",
      description: "SWIR Band B356",
      'gee:units': "unitless",
      center_wavelength:2.1603400707,
      full_width_half_max:0.0061456673,
      'gee:wavelength': "2160.3423nm, FWHM: 6.1457nm"
     },
     {
      name: "B357",
      description: "SWIR Band B357",
      'gee:units': "unitless",
      center_wavelength:2.1653499603,
      full_width_half_max:0.0061492906,
      'gee:wavelength': "2165.351nm, FWHM: 6.1493nm"
     },
     {
      name: "B358",
      description: "SWIR Band B358",
      'gee:units': "unitless",
      center_wavelength:2.1703600883,
      full_width_half_max:0.0061529251,
      'gee:wavelength': "2170.3599nm, FWHM: 6.1529nm"
     },
     {
      name: "B359",
      description: "SWIR Band B359",
      'gee:units': "unitless",
      center_wavelength:2.175369978,
      full_width_half_max:0.0061565717,
      'gee:wavelength': "2175.3684nm, FWHM: 6.1566nm"
     },
     {
      name: "B360",
      description: "SWIR Band B360",
      'gee:units': "unitless",
      center_wavelength:2.180380106,
      full_width_half_max:0.0061602299,
      'gee:wavelength': "2180.3774nm, FWHM: 6.1602nm"
     },
     {
      name: "B361",
      description: "SWIR Band B361",
      'gee:units': "unitless",
      center_wavelength:2.1853899956,
      full_width_half_max:0.0061639012,
      'gee:wavelength': "2185.386nm, FWHM: 6.1639nm"
     },
     {
      name: "B362",
      description: "SWIR Band B362",
      'gee:units': "unitless",
      center_wavelength:2.19039011,
      full_width_half_max:0.0061675836,
      'gee:wavelength': "2190.3948nm, FWHM: 6.1676nm"
     },
     {
      name: "B363",
      description: "SWIR Band B363",
      'gee:units': "unitless",
      center_wavelength:2.1953999996,
      full_width_half_max:0.0061712796,
      'gee:wavelength': "2195.4033nm, FWHM: 6.1713nm"
     },
     {
      name: "B364",
      description: "SWIR Band B364",
      'gee:units': "unitless",
      center_wavelength:2.2004098892,
      full_width_half_max:0.0061749867,
      'gee:wavelength': "2200.4119nm, FWHM: 6.175nm"
     },
     {
      name: "B365",
      description: "SWIR Band B365",
      'gee:units': "unitless",
      center_wavelength:2.2054200172,
      full_width_half_max:0.0061787078,
      'gee:wavelength': "2205.4207nm, FWHM: 6.1787nm"
     },
     {
      name: "B366",
      description: "SWIR Band B366",
      'gee:units': "unitless",
      center_wavelength:2.2104299068,
      full_width_half_max:0.006182435,
      'gee:wavelength': "2210.4292nm, FWHM: 6.1824nm"
     },
     {
      name: "B367",
      description: "SWIR Band B367",
      'gee:units': "unitless",
      center_wavelength:2.2154400349,
      full_width_half_max:0.0061861817,
      'gee:wavelength': "2215.4377nm, FWHM: 6.1862nm"
     },
     {
      name: "B368",
      description: "SWIR Band B368",
      'gee:units': "unitless",
      center_wavelength:2.2204499245,
      full_width_half_max:0.00618994,
      'gee:wavelength': "2220.4468nm, FWHM: 6.1899nm"
     },
     {
      name: "B369",
      description: "SWIR Band B369",
      'gee:units': "unitless",
      center_wavelength:2.2254600525,
      full_width_half_max:0.0061937077,
      'gee:wavelength': "2225.4556nm, FWHM: 6.1937nm"
     },
     {
      name: "B370",
      description: "SWIR Band B370",
      'gee:units': "unitless",
      center_wavelength:2.2304599285,
      full_width_half_max:0.006197487,
      'gee:wavelength': "2230.464nm, FWHM: 6.1975nm"
     },
     {
      name: "B371",
      description: "SWIR Band B371",
      'gee:units': "unitless",
      center_wavelength:2.2354700565,
      full_width_half_max:0.0062012817,
      'gee:wavelength': "2235.473nm, FWHM: 6.2013nm"
     },
     {
      name: "B372",
      description: "SWIR Band B372",
      'gee:units': "unitless",
      center_wavelength:2.2404799461,
      full_width_half_max:0.0062050871,
      'gee:wavelength': "2240.4817nm, FWHM: 6.2051nm"
     },
     {
      name: "B373",
      description: "SWIR Band B373",
      'gee:units': "unitless",
      center_wavelength:2.2454900742,
      full_width_half_max:0.0062089041,
      'gee:wavelength': "2245.49nm, FWHM: 6.2089nm"
     },
     {
      name: "B374",
      description: "SWIR Band B374",
      'gee:units': "unitless",
      center_wavelength:2.2504999638,
      full_width_half_max:0.0062127342,
      'gee:wavelength': "2250.4988nm, FWHM: 6.2127nm"
     },
     {
      name: "B375",
      description: "SWIR Band B375",
      'gee:units': "unitless",
      center_wavelength:2.2555100918,
      full_width_half_max:0.0062165768,
      'gee:wavelength': "2255.5073nm, FWHM: 6.2166nm"
     },
     {
      name: "B376",
      description: "SWIR Band B376",
      'gee:units': "unitless",
      center_wavelength:2.2605199814,
      full_width_half_max:0.006220432,
      'gee:wavelength': "2260.516nm, FWHM: 6.2204nm"
     },
     {
      name: "B377",
      description: "SWIR Band B377",
      'gee:units': "unitless",
      center_wavelength:2.2655200958,
      full_width_half_max:0.0062242979,
      'gee:wavelength': "2265.5247nm, FWHM: 6.2243nm"
     },
     {
      name: "B378",
      description: "SWIR Band B378",
      'gee:units': "unitless",
      center_wavelength:2.2705299854,
      full_width_half_max:0.0062281792,
      'gee:wavelength': "2270.5334nm, FWHM: 6.2282nm"
     },
     {
      name: "B379",
      description: "SWIR Band B379",
      'gee:units': "unitless",
      center_wavelength:2.2755401134,
      full_width_half_max:0.0062320703,
      'gee:wavelength': "2275.5422nm, FWHM: 6.2321nm"
     },
     {
      name: "B380",
      description: "SWIR Band B380",
      'gee:units': "unitless",
      center_wavelength:2.2805500031,
      full_width_half_max:0.0062359744,
      'gee:wavelength': "2280.551nm, FWHM: 6.236nm"
     },
     {
      name: "B381",
      description: "SWIR Band B381",
      'gee:units': "unitless",
      center_wavelength:2.2855598927,
      full_width_half_max:0.0062398934,
      'gee:wavelength': "2285.5598nm, FWHM: 6.2399nm"
     },
     {
      name: "B382",
      description: "SWIR Band B382",
      'gee:units': "unitless",
      center_wavelength:2.2905700207,
      full_width_half_max:0.0062438198,
      'gee:wavelength': "2290.5684nm, FWHM: 6.2438nm"
     },
     {
      name: "B383",
      description: "SWIR Band B383",
      'gee:units': "unitless",
      center_wavelength:2.2955799103,
      full_width_half_max:0.0062477598,
      'gee:wavelength': "2295.577nm, FWHM: 6.2478nm"
     },
     {
      name: "B384",
      description: "SWIR Band B384",
      'gee:units': "unitless",
      center_wavelength:2.3005900383,
      full_width_half_max:0.0062517142,
      'gee:wavelength': "2300.5857nm, FWHM: 6.2517nm"
     },
     {
      name: "B385",
      description: "SWIR Band B385",
      'gee:units': "unitless",
      center_wavelength:2.3055899143,
      full_width_half_max:0.0062556798,
      'gee:wavelength': "2305.5942nm, FWHM: 6.2557nm"
     },
     {
      name: "B386",
      description: "SWIR Band B386",
      'gee:units': "unitless",
      center_wavelength:2.3106000423,
      full_width_half_max:0.0062596588,
      'gee:wavelength': "2310.603nm, FWHM: 6.2597nm"
     },
     {
      name: "B387",
      description: "SWIR Band B387",
      'gee:units': "unitless",
      center_wavelength:2.3156099319,
      full_width_half_max:0.0062636505,
      'gee:wavelength': "2315.6116nm, FWHM: 6.2637nm"
     },
     {
      name: "B388",
      description: "SWIR Band B388",
      'gee:units': "unitless",
      center_wavelength:2.32062006,
      full_width_half_max:0.006267651,
      'gee:wavelength': "2320.6204nm, FWHM: 6.2677nm"
     },
     {
      name: "B389",
      description: "SWIR Band B389",
      'gee:units': "unitless",
      center_wavelength:2.3256299496,
      full_width_half_max:0.0062716664,
      'gee:wavelength': "2325.6292nm, FWHM: 6.2717nm"
     },
     {
      name: "B390",
      description: "SWIR Band B390",
      'gee:units': "unitless",
      center_wavelength:2.3306400776,
      full_width_half_max:0.0062756962,
      'gee:wavelength': "2330.638nm, FWHM: 6.2757nm"
     },
     {
      name: "B391",
      description: "SWIR Band B391",
      'gee:units': "unitless",
      center_wavelength:2.3356499672,
      full_width_half_max:0.0062797344,
      'gee:wavelength': "2335.6465nm, FWHM: 6.2797nm"
     },
     {
      name: "B392",
      description: "SWIR Band B392",
      'gee:units': "unitless",
      center_wavelength:2.3406600952,
      full_width_half_max:0.0062837889,
      'gee:wavelength': "2340.655nm, FWHM: 6.2838nm"
     },
     {
      name: "B393",
      description: "SWIR Band B393",
      'gee:units': "unitless",
      center_wavelength:2.3456599712,
      full_width_half_max:0.0062878542,
      'gee:wavelength': "2345.6638nm, FWHM: 6.2879nm"
     },
     {
      name: "B394",
      description: "SWIR Band B394",
      'gee:units': "unitless",
      center_wavelength:2.3506700993,
      full_width_half_max:0.0062919315,
      'gee:wavelength': "2350.6724nm, FWHM: 6.2919nm"
     },
     {
      name: "B395",
      description: "SWIR Band B395",
      'gee:units': "unitless",
      center_wavelength:2.3556799889,
      full_width_half_max:0.0062960209,
      'gee:wavelength': "2355.6812nm, FWHM: 6.296nm"
     },
     {
      name: "B396",
      description: "SWIR Band B396",
      'gee:units': "unitless",
      center_wavelength:2.3606901169,
      full_width_half_max:0.0063001248,
      'gee:wavelength': "2360.69nm, FWHM: 6.3001nm"
     },
     {
      name: "B397",
      description: "SWIR Band B397",
      'gee:units': "unitless",
      center_wavelength:2.3657000065,
      full_width_half_max:0.0063042399,
      'gee:wavelength': "2365.6985nm, FWHM: 6.3042nm"
     },
     {
      name: "B398",
      description: "SWIR Band B398",
      'gee:units': "unitless",
      center_wavelength:2.3707098961,
      full_width_half_max:0.0063083675,
      'gee:wavelength': "2370.7073nm, FWHM: 6.3084nm"
     },
     {
      name: "B399",
      description: "SWIR Band B399",
      'gee:units': "unitless",
      center_wavelength:2.3757200241,
      full_width_half_max:0.0063125077,
      'gee:wavelength': "2375.716nm, FWHM: 6.3125nm"
     },
     {
      name: "B400",
      description: "SWIR Band B400",
      'gee:units': "unitless",
      center_wavelength:2.3807199001,
      full_width_half_max:0.006316659,
      'gee:wavelength': "2380.7246nm, FWHM: 6.3167nm"
     },
     {
      name: "B401",
      description: "SWIR Band B401",
      'gee:units': "unitless",
      center_wavelength:2.3857300282,
      full_width_half_max:0.0063208253,
      'gee:wavelength': "2385.7332nm, FWHM: 6.3208nm"
     },
     {
      name: "B402",
      description: "SWIR Band B402",
      'gee:units': "unitless",
      center_wavelength:2.3907399178,
      full_width_half_max:0.0063250037,
      'gee:wavelength': "2390.7422nm, FWHM: 6.325nm"
     },
     {
      name: "B403",
      description: "SWIR Band B403",
      'gee:units': "unitless",
      center_wavelength:2.3957500458,
      full_width_half_max:0.0063291937,
      'gee:wavelength': "2395.7507nm, FWHM: 6.3292nm"
     },
     {
      name: "B404",
      description: "SWIR Band B404",
      'gee:units': "unitless",
      center_wavelength:2.4007599354,
      full_width_half_max:0.0063333954,
      'gee:wavelength': "2400.7593nm, FWHM: 6.3334nm"
     },
     {
      name: "B405",
      description: "SWIR Band B405",
      'gee:units': "unitless",
      center_wavelength:2.4057700634,
      full_width_half_max:0.0063376119,
      'gee:wavelength': "2405.7678nm, FWHM: 6.3376nm"
     },
     {
      name: "B406",
      description: "SWIR Band B406",
      'gee:units': "unitless",
      center_wavelength:2.410779953,
      full_width_half_max:0.0063418415,
      'gee:wavelength': "2410.7769nm, FWHM: 6.3418nm"
     },
     {
      name: "B407",
      description: "SWIR Band B407",
      'gee:units': "unitless",
      center_wavelength:2.415790081,
      full_width_half_max:0.0063460814,
      'gee:wavelength': "2415.7854nm, FWHM: 6.3461nm"
     },
     {
      name: "B408",
      description: "SWIR Band B408",
      'gee:units': "unitless",
      center_wavelength:2.420789957,
      full_width_half_max:0.0063503352,
      'gee:wavelength': "2420.7942nm, FWHM: 6.3503nm"
     },
     {
      name: "B409",
      description: "SWIR Band B409",
      'gee:units': "unitless",
      center_wavelength:2.4258000851,
      full_width_half_max:0.0063545997,
      'gee:wavelength': "2425.803nm, FWHM: 6.3546nm"
     },
     {
      name: "B410",
      description: "SWIR Band B410",
      'gee:units': "unitless",
      center_wavelength:2.4308099747,
      full_width_half_max:0.0063588796,
      'gee:wavelength': "2430.8113nm, FWHM: 6.3589nm"
     },
     {
      name: "B411",
      description: "SWIR Band B411",
      'gee:units': "unitless",
      center_wavelength:2.4358201027,
      full_width_half_max:0.0063631702,
      'gee:wavelength': "2435.82nm, FWHM: 6.3632nm"
     },
     {
      name: "B412",
      description: "SWIR Band B412",
      'gee:units': "unitless",
      center_wavelength:2.4408299923,
      full_width_half_max:0.0063674743,
      'gee:wavelength': "2440.8286nm, FWHM: 6.3675nm"
     },
     {
      name: "B413",
      description: "SWIR Band B413",
      'gee:units': "unitless",
      center_wavelength:2.4458398819,
      full_width_half_max:0.0063717905,
      'gee:wavelength': "2445.8374nm, FWHM: 6.3718nm"
     },
     {
      name: "B414",
      description: "SWIR Band B414",
      'gee:units': "unitless",
      center_wavelength:2.4508500099,
      full_width_half_max:0.0063761217,
      'gee:wavelength': "2450.846nm, FWHM: 6.3761nm"
     },
     {
      name: "B415",
      description: "SWIR Band B415",
      'gee:units': "unitless",
      center_wavelength:2.4558498859,
      full_width_half_max:0.0063804626,
      'gee:wavelength': "2455.855nm, FWHM: 6.3805nm"
     },
     {
      name: "B416",
      description: "SWIR Band B416",
      'gee:units': "unitless",
      center_wavelength:2.460860014,
      full_width_half_max:0.0063848165,
      'gee:wavelength': "2460.8635nm, FWHM: 6.3848nm"
     },
     {
      name: "B417",
      description: "SWIR Band B417",
      'gee:units': "unitless",
      center_wavelength:2.4658699036,
      full_width_half_max:0.0063891839,
      'gee:wavelength': "2465.8723nm, FWHM: 6.3892nm"
     },
     {
      name: "B418",
      description: "SWIR Band B418",
      'gee:units': "unitless",
      center_wavelength:2.4708800316,
      full_width_half_max:0.0063935672,
      'gee:wavelength': "2470.881nm, FWHM: 6.3936nm"
     },
     {
      name: "B419",
      description: "SWIR Band B419",
      'gee:units': "unitless",
      center_wavelength:2.4758899212,
      full_width_half_max:0.0063979598,
      'gee:wavelength': "2475.89nm, FWHM: 6.398nm"
     },
     {
      name: "B420",
      description: "SWIR Band B420",
      'gee:units': "unitless",
      center_wavelength:2.4809000492,
      full_width_half_max:0.0064023668,
      'gee:wavelength': "2480.8987nm, FWHM: 6.4024nm"
     },
     {
      name: "B421",
      description: "SWIR Band B421",
      'gee:units': "unitless",
      center_wavelength:2.4859099388,
      full_width_half_max:0.0064067845,
      'gee:wavelength': "2485.907nm, FWHM: 6.4068nm"
     },
     {
      name: "B422",
      description: "SWIR Band B422",
      'gee:units': "unitless",
      center_wavelength:2.4909200668,
      full_width_half_max:0.0064112167,
      'gee:wavelength': "2490.9158nm, FWHM: 6.4112nm"
     },
     {
      name: "B423",
      description: "SWIR Band B423",
      'gee:units': "unitless",
      center_wavelength:2.4959199429,
      full_width_half_max:0.0064156638,
      'gee:wavelength': "2495.9243nm, FWHM: 6.4157nm"
     },
     {
      name: "B424",
      description: "SWIR Band B424",
      'gee:units': "unitless",
      center_wavelength:2.5009300709,
      full_width_half_max:0.0064201197,
      'gee:wavelength': "2500.933nm, FWHM: 6.4201nm"
     },
     {
      name: "B425",
      description: "SWIR Band B425",
      'gee:units': "unitless",
      center_wavelength:2.5059399605,
      full_width_half_max:0.0064245905,
      'gee:wavelength': "2505.9417nm, FWHM: 6.4246nm"
     },
     {
      name: "B426",
      description: "SWIR Band B426",
      'gee:units': "unitless",
      center_wavelength:2.5109500885,
      full_width_half_max:0.0064290729,
      'gee:wavelength': "2510.9507nm, FWHM: 6.4291nm"
     },
     {
      name: 'B427',
      scale:1.0,
      units:'degrees',
      description: 'Aerosol Optical Depth'
     },
     {
      name: 'B428',
      scale:1.0,
      units:'degrees',
      description: 'Aspect used as input to ATCOR'
     },
     {
      name: 'B429',
      scale:1.0,
      units: 'Flag: 1=shadow; 0=no shadow',
      description: 'Cast Shadow mask used as input to ATCOR'
     },
     {
      name: 'B430',
      scale:1.0,
      'gee:classes': [
              {
                value: 0,
                color: '0a0a0a',
                description: 'geocoded background',
              },
              {
                value: 1,
                color: '135e9c',
                description: 'water',
              },
              {
                value: 2,
                color: '063d08',
                description: 'DDV reference',
              },
             {
                value: 3,
                color: 'e1e3e1',
                description: 'non-reference',
              },
             {
                value: 4,
                color: '383734',
                description: 'topographic shadow',
              },
      ],
    description: 'Dark Dense Vegetation Classification'
     },
     {
      name: 'B431',
      scale: 1.0,
      description: 'Haze Cloud Water Map generate by ATCOR',
      'gee:classes': [
          {
            value: 0,
            color: '000000',
            description: 'geocoded background',
          },
          {
            value: 1,
            color: '474747',
            description: 'shadow',
          },
          {
            value: 2,
            color: '9db8d1',
            description: 'thin cirrus (water)',
          },
          {
            value: 3,
            color: '5a6978',
            description: 'medium cirrus (water)',
          },
          {
            value: 4,
            color: '3d4a57',
            description: 'thick cirrus (water)',
          },
          {
            value: 5,
            color: '5d7554',
            description: 'land (clear)',
          },
          {
            value: 6,
            color: '454d42',
            description: 'saturated',
          },
          {
            value: 7,
            color: 'f7f7f7',
            description: 'snow/ice',
          },
          {
            value: 8,
            color: 'd5e3d3',
            description: 'thin cirrus (land)',
          },
          {
            value: 9,
            color: '9da89b',
            description: 'medium cirrus (land)',
          },
          {
            value: 10,
            color: '5a6359',
            description: 'thick cirrus (land)',
          },
          {
            value: 11,
            color: 'ced4cd',
            description: 'thin haze (land)',
          },
          {
            value: 12,
            color: '8c918c',
            description: 'medium haze (land)',
          },
          {
            value: 13,
            color: 'ceddde',
            description: 'thin haze/glint (water)',
          },
          {
            value: 14,
            color: '849596',
            description: 'med. haze/glint (water)',
          },
          {
            value: 15,
            color: '98a39b',
            description: 'cloud (land)',
          },
          {
            value: 16,
            color: '9899a3',
            description: 'cloud (water)',
          },
          {
            value: 17,
            color: '135e9c',
            description: 'water',
          },          
          {
            value: 18,
            color: 'e1e8ed',
            description: 'cirrus cloud',
          },
          {
            value: 19,
            color: '9ea7ad',
            description: 'cirrus cloud (thick)',
          },
          {
            value: 20,
            color: 'dffa11',
            description: 'bright',
          },
          {
            value: 21,
            color: '383734',
            description: 'topographic shadow',
          },
          {
            value: 22,
            color: '4f4f4e',
            description: 'cloud (building) shadow',
          },
      ]
     },
     {
      name: 'B432',
      scale:1.0,
      units:'degrees',
      description: 'Illumination Factor used as input to ATCOR'
     },
     {
      name: 'B433',
      scale:1.0,
      units:'meters',
      description: 'Path length between sensor and surface'
     },
     {
      name: 'B434',
      scale:1.0,
      units:'percent',
      description: 'Sky View Factor used as input to ATCOR'
     },
     {
      name: 'B435',
      scale:1.0,
      units:'degrees',
      description: 'Slope used as input to ATCOR'
     },
     {
      name: 'B436',
      scale:1.0,
      units:'meters',
      description: 'Smooth Surface Elevation used as input to ATCOR'
     },
     {
      name: 'B437',
      scale:1.0,
      units:'kilometers',
      description: 'Visibility Index Map - sea level values of visibility index / total optical thickeness'
     },
     {
      name: 'B438',
      scale:1.0,
      units:'centimeters',
      description: 'Water Vapor Column - (cm)*1000 ground-to-space used in ATCOR'
     },
     {
      name: 'B439',
      scale:1.0,
      units:'degrees',
      description: 'to-sensor Azimuth Angle'
     },
     {
      name: 'B440',
      scale:1.0,
      units:'degrees',
      description: 'to-sensor Zenith Angle'
     },
     {
      name: 'B441',
      scale:1.0,
        'gee:classes': [
            {
            value: 0,
            color: '239e2f',
            description: 'mostly clear: <10% cloud cover',
            },
            {
            value: 1,
            color: 'f5ee1d',
            description: 'partly cloudy: 10-50% cloud cover',
            },
            {
            value: 2,
            color: 'c40a0a',
            description: 'mostly cloudy: >50% cloud cover',
            },
      ],
      description: 'Weather Quality Indicator - estimated percentage of overhead cloud cover during acquisition'
     },
     {
      name: 'B442',
      scale:1.0,
      units:'date yyyy-mm-dd',
      description: 'Acquisition Date, YYYYMMDD'
     }
    ],
    'gee:visualizations': [
      {
        display_name: 'RGB',
        lookat: {
          lat: 39.8283,
          lon: -98.5795,
          zoom: 9, 
        },
        image_visualization: {
          band_vis: {
            min: [
              1000.0,
            ],
            max: [
              14000.0,
            ],
            gamma: [
              2.5,
            ],
            bands: [
              'B053',
              'B035',
              'B019',
            ],
          },
        },
      },
    ],
  },
  'sci:citation': 'See [NEON citation guidelines](https://www.neonscience.org/data-samples/guidelines-policies/citing)',
  'gee:terms_of_use': ee.gee_terms_of_use(license) + '\n\n' + |||
    All data collected by NEON and provided as data products, with the exception
    of data related to rare, threatened, or endangered (RTE) species, are
    released to the public domain under [Creative Commons CC0 1.0 "No Rights
    Reserved"](https://creativecommons.org/publicdomain/zero/1.0/). No
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
    data, using the documentation associated with the data packages as a guide. 
    Please refer to [NEON Data Guidelines and Policies](https://www.neonscience.org/data-samples/guidelines-policies)
    for detailed information on how to properly use and cite NEON data, as well as
    best practices for publishing research that uses NEON data.
  |||,
}