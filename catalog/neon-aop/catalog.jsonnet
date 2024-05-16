local id = 'neon-aop';
local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';

local basename = 'catalog';
local base_filename = basename + '.json';
local base_url = ee_const.catalog_base + 'neon-aop/';
local parent_url = ee_const.catalog_base + 'catalog.json';
local self_url = base_url + base_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.catalog,
  id: id,
  title: id,
  description: importstr 'description.md',
  links: [
    ee.link.root(),
    ee.link.parent(parent_url),
    ee.link.self_link(self_url),
    // TODO(schwehr): Uncomment when the datases are ready.
    ee.link.child_collection('projects_neon-aop_assets_chm', base_url),
    // ee.link.child_collection('projects_neon-aop_assets_dem', base_url),
    // ee.link.child_collection('projects_neon-aop_assets_rgb', base_url),
    // ee.link.child_collection('projects_neon-aop_assets_sdr', base_url),
    // ee.link.child_collection('projects_neon-aop_assets_sbr', base_url),
  ],
}
