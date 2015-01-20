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
        'Ubuntu',
        'System Default'
      ]
    fontWeight:
      description: 'Not all fonts come in all weights: Canterell and Oxygen
        only have regular, Ubuntu and Open Sans don\'t have thin.'
      type: 'string'
      default: 'Light'
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
      description: 'Make the selected file stand out in tree-view.
        Looks better off when scrollbars always visible (e.g. on Linux)'
      type: 'boolean'
      default: true
    customBackgroundColor:
      description: 'Choose a custom background color.'
      type: 'boolean'
      default: false
    customBackgroundColorPicker:
      description: 'Choose your background color.'
      type: 'color'
      default: 'white'
    backgroundGradient:
      description: 'Apply a subtle gradient to the background.'
      type: 'boolean'
      default: false
    backgroundImage:
      description: 'Use an image as a background.'
      type: 'boolean'
      default: false
    backgroundImagePath:
      description: 'The path to an image from your computer or
       the internets (e.g. hubblesite.org or unsplash.com).'
      type: 'string'
      default: 'atom://isotope-ui/resources/images/raket.jpg'
    gutterStyle:
      description: 'Turn off to relegate gutter styling to syntax theme.'
      type: 'boolean'
      default: true
    lowContrastTooltip:
      description: 'Make tooltips low contrast and not so colorful.'
      type: 'boolean'
      default: false


  activate: (state) ->
    # code in separate file so deferral keeps activation time down
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
