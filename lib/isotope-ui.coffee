module.exports =

  config:
    fontFamily:
      description: 'Use one of the fonts available in this package.'
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
      description: 'Not all fonts come in all weights: Canterell and Oxygen only have regular, Ubuntu and Open Sans don\'t have thin.'
      type: 'string'
      default: 'Extra light / Thin'
      enum: [
        'Extra light / Thin',
        'Light',
        'Regular'
      ]

  activate: (state) ->

    applyFont = (font) ->
      atom.workspaceView.attr('isotope-ui-font', font)

    applyFontWeight = (weight) ->
      atom.workspaceView.attr('isotope-ui-fontweight', weight)

    atom.workspaceView.ready ->
      applyFont(atom.config.get('isotope-ui.fontFamily'))
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))

    atom.config.observe 'isotope-ui.fontFamily', =>
      applyFont(atom.config.get('isotope-ui.fontFamily'))

    atom.config.observe 'isotope-ui.fontWeight', =>
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))
