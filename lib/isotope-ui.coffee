module.exports =

  config:
    fontFamily:
      description: 'Use one of the fonts available in this package.
        View the README for descriptions of each.'
      type: 'string'
      default: 'Open Sans'
      enum: [
        'Cantarell',
        'Clear Sans',
        'Fira Sans',
        'Open Sans',
        'Oxygen',
        'Roboto',
        'Source Sans Pro',
        'Ubuntu'
      ]
    fontWeight:
      description: 'Not all fonts come in all weights: Canterell and Oxygen
        only have regular, Ubuntu and Open Sans don\'t have thin.'
      type: 'string'
      default: 'Extra light / Thin'
      enum: [
        'Extra light / Thin',
        'Light',
        'Regular'
      ]
    compactLayout:
      description: 'Make UI chrome take up less space vertically
        (useful on small screens).'
      type: 'boolean'
      default: false
    colorTreeSelection:
      description: 'Make the selected file stand out in tree-view.'
      type: 'boolean'
      default: true
    backgroundGradient:
      description: 'Experimental: apply a subtle gradient to the background.'
      type: 'boolean'
      default: false
    backgroundImage:
      description: 'Experimental: use an image as a background.'
      type: 'boolean'
      default: false
    backgroundImageUrl:
      description: 'Experimental: the url for an image from te internets.'
      type: 'string'
      default: 'atom://isotope-ui/resources/images/hubble.jpg'


  activate: (state) ->
    # code in separate file so deferral keeps activation time down
    atom.workspaceView.ready ->
      Config = require './config'
      Config.apply()
