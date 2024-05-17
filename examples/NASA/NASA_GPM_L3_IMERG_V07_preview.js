// GPM V6 30 minute data around hurricane Dorian for a single day.
var range = ee.Date('2023-09-03').getRange('day');
var dataset = ee.ImageCollection('NASA/GPM_L3/IMERG_V07')
    .filter(ee.Filter.date(range));

// Select the max precipitation and mask out low precipitation values.
var precipitation = dataset.select('precipitation').max();
var mask = precipitation.gt(0.5);
var precipitation = precipitation.updateMask(mask);

var palette = [
  '000096','0064ff', '00b4ff', '33db80', '9beb4a',
  'ffeb00', 'ffb300', 'ff6400', 'eb1e00', 'af0000'
];
var lon = 26.73;
var lat = 4.26;
Map.setCenter(lon, lat, 2);
var delta = 50;
// Width and height of the thumbnail image.
var pixels = 256;
var areaOfInterest = ee.Geometry.Rectangle(
    [lon - delta, lat - delta, lon + delta, lat + delta], null, false);

var visParams = {
  dimensions: [pixels, pixels],
  region: areaOfInterest,
  crs: 'EPSG:3857',
  format: 'png',
};

var backGround = ee.Image.constant(1).visualize({palette:['808080'],min:0,max:1})

var precipitationVis = {min: 0.0, max: 1.5, palette: palette};

var image1 = precipitation.visualize({min: 0.0, max: 1.5, palette: palette});

var imageWithBackground = ee.ImageCollection([backGround,image1]).mosaic();

Map.addLayer(imageWithBackground, null, 'Precipitation (mm/hr)');

Map.setCenter(-76, 33, 3);

print(ui.Thumbnail({image: imageWithBackground, params: visParams}));
