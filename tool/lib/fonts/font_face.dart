typedef FontFace = ({String family, String variant, String hash, int length});

const appFontFaces = <FontFace>[
  (
    family: 'Fraunces',
    variant: 'SemiBold',
    hash: '089e9beb4054ffa5870fd97578bcb6bc8e2664ba610d1a76389be114997d1d33',
    length: 71608,
  ),
  (
    family: 'Inter',
    variant: 'Regular',
    hash: '15b294b67f2f8bbc04d990023ef4aec66502b87dc9040d84abe5f896ccb693de',
    length: 324796,
  ),
  (
    family: 'Inter',
    variant: 'Medium',
    hash: '36a36ff7ac46dc2aeceac3a80a87a67e7b844b8fc936699259aac8fba9bcf734',
    length: 325280,
  ),
  (
    family: 'Inter',
    variant: 'SemiBold',
    hash: '334bb2c51aeba5f566abac8d03a7e75ab3234d6926b52e92a85dc704129258b5',
    length: 326024,
  ),
  (
    family: 'RobotoMono',
    variant: 'Regular',
    hash: 'c75c21ddc0cad53a5651e0cbb4a0184d71f0b72d05405d2e4121f637479da64e',
    length: 78924,
  ),
];

Set<String> get appFontFamilies => {
  for (final face in appFontFaces) face.family,
};

String fontFileName(FontFace face) => '${face.family}-${face.variant}.ttf';

String fontLicenseFileName(String family) => '$family-OFL.txt';

Uri fontUri(FontFace face) =>
    Uri.parse('https://fonts.gstatic.com/s/a/${face.hash}.ttf');

Uri fontLicenseUri(String family) => Uri.parse(
  'https://raw.githubusercontent.com/google/fonts/main/ofl/'
  '${family.toLowerCase()}/OFL.txt',
);
