object UniServerModule: TUniServerModule
  OldCreateOrder = False
  OnCreate = UniGUIServerModuleCreate
  OnDestroy = UniGUIServerModuleDestroy
  AutoCoInitialize = True
  TempFolder = 'temp\'
  Port = 93
  Title = 'OpenLABs [0.1.19]'
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomFiles.Strings = (
    'files\dependencies\rsvp-3.1.0.min.js'
    'files\dependencies\sha-256.min.js'
    'files\qz-tray.js'
    'files\qz-tray-cert.js'
    'files\jsrsasign-all-min.js'
    'files\webcam.min.js')
  CustomCSS.Strings = (
    '@font-face {'
    '    font-family: '#39'robotoregular'#39';'
    
      '    src: url('#39'files/webfonts/roboto_regular_macroman/Roboto-Regu' +
      'lar-webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_regular_macromanRoboto-Regul' +
      'ar-webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_regular_macromanRoboto-Regul' +
      'ar-webfont.woff2'#39') format('#39'woff2'#39'),'
    
      '         url('#39'files/webfonts/roboto_regular_macromanRoboto-Regul' +
      'ar-webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_regular_macromanRoboto-Regul' +
      'ar-webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_regular_macromanRoboto-Regul' +
      'ar-webfont.svg#robotoregular'#39') format('#39'svg'#39');'
    '    font-weight: normal;'
    '    font-style: normal;'
    ''
    '}'
    ''
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_italic_macroman/Roboto-Itali' +
      'c-webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_italic_macroman/Roboto-Itali' +
      'c-webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_italic_macroman/Roboto-Itali' +
      'c-webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_italic_macroman/Roboto-Itali' +
      'c-webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_italic_macroman/Roboto-Itali' +
      'c-webfont.svg#RobotoItalic'#39') format('#39'svg'#39');'
    '    font-weight: normal;'
    '    font-style: italic;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_bold_macroman/Roboto-Bold-we' +
      'bfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_bold_macroman/Roboto-Bold-we' +
      'bfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_bold_macroman/Roboto-Bold-we' +
      'bfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_bold_macroman/Roboto-Bold-we' +
      'bfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_bold_macroman/Roboto-Bold-we' +
      'bfont.svg#RobotoBold'#39') format('#39'svg'#39');'
    '    font-weight: bold;'
    '    font-style: normal;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_bolditalic_macroman/Roboto-B' +
      'oldItalic-webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_bolditalic_macroman/Roboto-B' +
      'oldItalic-webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_bolditalic_macroman/Roboto-B' +
      'oldItalic-webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_bolditalic_macroman/Roboto-B' +
      'oldItalic-webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_bolditalic_macroman/Roboto-B' +
      'oldItalic-webfont.svg#RobotoBoldItalic'#39') format('#39'svg'#39');'
    '    font-weight: bold;'
    '    font-style: italic;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_thin_macroman/Roboto-Thin-we' +
      'bfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_thin_macroman/Roboto-Thin-we' +
      'bfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_thin_macroman/Roboto-Thin-we' +
      'bfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_thin_macroman/Roboto-Thin-we' +
      'bfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_thin_macroman/Roboto-Thin-we' +
      'bfont.svg#RobotoThin'#39') format('#39'svg'#39');'
    '    font-weight: 200;'
    '    font-style: normal;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_thinitalic_macroman/Roboto-T' +
      'hinItalic-webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_thinitalic_macroman/Roboto-T' +
      'hinItalic-webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_thinitalic_macroman/Roboto-T' +
      'hinItalic-webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_thinitalic_macroman/Roboto-T' +
      'hinItalic-webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_thinitalic_macroman/Roboto-T' +
      'hinItalic-webfont.svg#RobotoThinItalic'#39') format('#39'svg'#39'); (under t' +
      'he Apache Software License). '
    '    font-weight: 200;'
    '    font-style: italic;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_light_macroman/Roboto-Light-' +
      'webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_light_macroman/Roboto-Light-' +
      'webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_light_macroman/Roboto-Light-' +
      'webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_light_macroman/Roboto-Light-' +
      'webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_light_macroman/Roboto-Light-' +
      'webfont.svg#RobotoLight'#39') format('#39'svg'#39');'
    '    font-weight: 100;'
    '    font-style: normal;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_lightitalic_macroman/Roboto-' +
      'LightItalic-webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_lightitalic_macroman/Roboto-' +
      'LightItalic-webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_lightitalic_macroman/Roboto-' +
      'LightItalic-webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_lightitalic_macroman/Roboto-' +
      'LightItalic-webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_lightitalic_macroman/Roboto-' +
      'LightItalic-webfont.svg#RobotoLightItalic'#39') format('#39'svg'#39');'
    '    font-weight: 100;'
    '    font-style: italic;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_medium_macroman/Roboto-Mediu' +
      'm-webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_medium_macroman/Roboto-Mediu' +
      'm-webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_medium_macroman/Roboto-Mediu' +
      'm-webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_medium_macroman/Roboto-Mediu' +
      'm-webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_medium_macroman/Roboto-Mediu' +
      'm-webfont.svg#RobotoMedium'#39') format('#39'svg'#39');'
    '    font-weight: 300;'
    '    font-style: normal;'
    '}'
    ' '
    '@font-face {'
    '    font-family: '#39'Roboto'#39';'
    
      '    src: url('#39'files/webfonts/roboto_mediumitalic_macroman/Roboto' +
      '-MediumItalic-webfont.eot'#39');'
    
      '    src: url('#39'files/webfonts/roboto_mediumitalic_macroman/Roboto' +
      '-MediumItalic-webfont.eot?#iefix'#39') format('#39'embedded-opentype'#39'),'
    
      '         url('#39'files/webfonts/roboto_mediumitalic_macroman/Roboto' +
      '-MediumItalic-webfont.woff'#39') format('#39'woff'#39'),'
    
      '         url('#39'files/webfonts/roboto_mediumitalic_macroman/Roboto' +
      '-MediumItalic-webfont.ttf'#39') format('#39'truetype'#39'),'
    
      '         url('#39'files/webfonts/roboto_mediumitalic_macroman/Roboto' +
      '-MediumItalic-webfont.svg#RobotoMediumItalic'#39') format('#39'svg'#39');'
    '    font-weight: 300;'
    '    font-style: italic;'
    '}')
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Koneksi error'
  ConnectionFailureRecovery.RetryMessage = 'Mencoba lagi...'
  OnBeforeInit = UniGUIServerModuleBeforeInit
  Height = 150
  Width = 215
  object FDManager1: TFDManager
    WaitCursor = gcrNone
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 48
    Top = 40
  end
end
