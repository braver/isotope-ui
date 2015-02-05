module.exports =

  apply: () ->

    # functions

    body = document.querySelector('body')

    applyFont = (font) ->
      body.setAttribute('isotope-ui-font', font)

    applyFontWeight = (weight) ->
      body.setAttribute('isotope-ui-fontweight', weight)

    applyTreeColor = () ->
      if atom.config.get('isotope-ui.colorTreeSelection')
        body.setAttribute('isotope-ui-treecolor', 'true')
      else
        body.setAttribute('isotope-ui-treecolor', 'false')

    applyBackgroundColor = () ->
      if atom.config.get('isotope-ui.customBackgroundColor')
        atom.config.set('isotope-ui.backgroundImage', 'false')
        atom.config.set('isotope-ui.backgroundGradient', 'false')
        body.setAttribute('isotope-ui-bg-color', 'true')
        body.style.backgroundColor = atom.config.get('isotope-ui.customBackgroundColorPicker').toHexString()
      else
        body.setAttribute('isotope-ui-bg-color', 'false')
        body.style.backgroundColor = ''

    applyBackgroundGradient = () ->
      if atom.config.get('isotope-ui.backgroundGradient')
        atom.config.set('isotope-ui.backgroundImage', 'false')
        atom.config.set('isotope-ui.backgroundColor', 'false')
        body.setAttribute('isotope-ui-bg-gradient', 'true')
      else
        body.setAttribute('isotope-ui-bg-gradient', 'false')
        #applyBackgroundImage()

    applyBackgroundImage = () ->
      if atom.config.get('isotope-ui.backgroundImage')
        atom.config.set('isotope-ui.customBackgroundColor', 'false')
        atom.config.set('isotope-ui.backgroundColor', 'false')
        atom.config.set('isotope-ui.backgroundGradient', 'false')
        body.setAttribute('isotope-ui-bg-image', 'true')
        body.style.backgroundImage =
          'url(' + atom.config.get('isotope-ui.backgroundImagePath') + ')'
      else
        body.setAttribute('isotope-ui-bg-image', 'false')
        body.style.backgroundImage = ''

    applyGutterStyle = () ->
      if atom.config.get('isotope-ui.gutterStyle')
        body.setAttribute('isotope-ui-gutter-style', 'true')
      else
        body.setAttribute('isotope-ui-gutter-style', 'false')

    applyTooltipContrast = () ->
      if atom.config.get('isotope-ui.lowContrastTooltip')
        body.setAttribute('isotope-ui-tooltip-lowcontrast', 'true')
      else
        body.setAttribute('isotope-ui-tooltip-lowcontrast', 'false')

    applyEditorFont = () ->
      if atom.config.get('isotope-ui.matchEditorFont')
        if atom.config.get('editor.fontFamily') is ''
          body.style.fontFamily = 'Inconsolata, Monaco, Consolas, "Courier New", Courier'
        else
          body.style.fontFamily = atom.config.get('editor.fontFamily')
      else
        body.style.fontFamily = ''


    # run when atom is ready

    applyFont(atom.config.get('isotope-ui.fontFamily'))
    applyFontWeight(atom.config.get('isotope-ui.fontWeight'))
    applyTreeColor()
    applyBackgroundGradient()
    applyBackgroundImage()
    applyBackgroundColor()
    applyGutterStyle()
    applyTooltipContrast()
    applyEditorFont()


    # run when configs change

    atom.config.onDidChange 'isotope-ui.fontFamily', ->
      applyFont(atom.config.get('isotope-ui.fontFamily'))

    atom.config.onDidChange 'isotope-ui.fontWeight', ->
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))

    atom.config.onDidChange 'isotope-ui.colorTreeSelection', ->
      applyTreeColor()

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

    atom.config.onDidChange 'isotope-ui.gutterStyle', ->
      applyGutterStyle()

    atom.config.onDidChange 'isotope-ui.lowContrastTooltip', ->
      applyTooltipContrast()

    atom.config.onDidChange 'isotope-ui.matchEditorFont', ->
      applyEditorFont()

    atom.config.onDidChange 'editor.fontFamily', ->
      applyEditorFont()
