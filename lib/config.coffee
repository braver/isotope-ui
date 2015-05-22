module.exports =

  apply: () ->

    body = document.querySelector('body')


    # functions

    applyFont = (font) ->
      body.setAttribute('data-isotope-ui-font', font)

    applyFontWeight = (weight) ->
      body.setAttribute('data-isotope-ui-fontweight', weight)

    applyBackgroundColor = () ->
      if atom.config.get('isotope-ui.customBackgroundColor')
        atom.config.set('isotope-ui.backgroundImage', 'false')
        atom.config.set('isotope-ui.backgroundGradient', 'false')
        body.setAttribute('data-isotope-ui-bg-color', 'true')
        body.style.backgroundColor = atom.config.get('isotope-ui.customBackgroundColorPicker').toHexString()
      else
        body.setAttribute('data-isotope-ui-bg-color', 'false')
        body.style.backgroundColor = ''

    applyBackgroundGradient = () ->
      if atom.config.get('isotope-ui.backgroundGradient')
        atom.config.set('isotope-ui.backgroundImage', 'false')
        atom.config.set('isotope-ui.customBackgroundColor', 'false')
        body.setAttribute('data-isotope-ui-bg-gradient', 'true')
      else
        body.setAttribute('data-isotope-ui-bg-gradient', 'false')

    applyBackgroundImage = () ->
      if atom.config.get('isotope-ui.backgroundImage')
        atom.config.set('isotope-ui.customBackgroundColor', 'false')
        atom.config.set('isotope-ui.customBackgroundColor', 'false')
        atom.config.set('isotope-ui.backgroundGradient', 'false')
        body.setAttribute('data-isotope-ui-bg-image', 'true')
        body.style.backgroundImage =
          'url(' + atom.config.get('isotope-ui.backgroundImagePath') + ')'
      else
        body.setAttribute('data-isotope-ui-bg-image', 'false')
        body.style.backgroundImage = ''

    applyTooltipContrast = () ->
      if atom.config.get('isotope-ui.lowContrastTooltip')
        body.setAttribute('data-isotope-ui-tooltip-lowcontrast', 'true')
      else
        body.setAttribute('data-isotope-ui-tooltip-lowcontrast', 'false')

    applyEditorFont = () ->
      if atom.config.get('isotope-ui.matchEditorFont')
        if atom.config.get('editor.fontFamily') is ''
          body.style.fontFamily = 'Inconsolata, Monaco, Consolas, "Courier New", Courier'
        else
          body.style.fontFamily = atom.config.get('editor.fontFamily')
      else
        body.style.fontFamily = ''

    applySpaciousMode = () ->
      if atom.config.get('isotope-ui.spaciousMode')
        atom.config.set('isotope-ui.minimalMode', 'false')
        body.setAttribute('data-isotope-ui-spacious', 'true')
      else
        body.setAttribute('data-isotope-ui-spacious', 'false')

    applyMinimalMode = () ->
      if atom.config.get('isotope-ui.minimalMode')
        atom.config.set('isotope-ui.spaciousMode', 'false')
        body.setAttribute('data-isotope-ui-minimal', 'true')
      else
        body.setAttribute('data-isotope-ui-minimal', 'false')


    # run when atom is ready

    applyFont(atom.config.get('isotope-ui.fontFamily'))
    applyFontWeight(atom.config.get('isotope-ui.fontWeight'))
    applyBackgroundGradient()
    applyBackgroundImage()
    applyBackgroundColor()
    applyTooltipContrast()
    applyEditorFont()
    applySpaciousMode()
    applyMinimalMode()


    # run when configs change

    atom.config.onDidChange 'isotope-ui.fontFamily', ->
      applyFont(atom.config.get('isotope-ui.fontFamily'))

    atom.config.onDidChange 'isotope-ui.fontWeight', ->
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))

    atom.config.onDidChange 'isotope-ui.customBackgroundColor', ->
      applyBackgroundColor()

    atom.config.onDidChange 'isotope-ui.customBackgroundColorPicker', ->
      applyBackgroundColor()

    atom.config.onDidChange 'isotope-ui.backgroundGradient', ->
      applyBackgroundGradient()

    atom.config.onDidChange 'isotope-ui.backgroundImage', ->
      applyBackgroundImage()

    atom.config.onDidChange 'isotope-ui.backgroundImagePath', ->
      applyBackgroundImage()

    atom.config.onDidChange 'isotope-ui.lowContrastTooltip', ->
      applyTooltipContrast()

    atom.config.onDidChange 'isotope-ui.matchEditorFont', ->
      applyEditorFont()

    atom.config.onDidChange 'isotope-ui.spaciousMode', ->
      applySpaciousMode()

    atom.config.onDidChange 'isotope-ui.minimalMode', ->
      applyMinimalMode()

    atom.config.onDidChange 'editor.fontFamily', ->
      applyEditorFont()
