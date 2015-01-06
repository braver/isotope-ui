module.exports =

  config:
    fontFamily:
      description: 'Use one of the fonts available in this package.'
      type: 'string'
      default: 'Open Sans'
      enum: ['Clear Sans', 'Open Sans', 'Source Sans Pro']
    fontWeight:
      description: '200 is "light", 400 is "regular" (Open Sans doesn\'t support 200)'
      type: 'integer'
      default: 200
      enum: [200, 300, 400]

  activate: (state) ->

    applyFont = (font) ->
      atom.workspaceView.attr('isotope-ui-font', font)

    applyFontWeight = (weight) ->
      atom.workspaceView.attr('isotope-ui-fontweight', weight)
      console.log('boikl')

    atom.workspaceView.ready ->
      applyFont(atom.config.get('isotope-ui.fontFamily'))
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))

    atom.config.observe 'isotope-ui.fontFamily', =>
      applyFont(atom.config.get('isotope-ui.fontFamily'))

    atom.config.observe 'isotope-ui.fontWeight', =>
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))
