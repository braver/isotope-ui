module.exports =

  apply: () ->

    # functions

    body = document.querySelector('body')

    # calculate lighter/darker color
    # http://stackoverflow.com/questions/5560248
    shadeColor = (color, percent) ->
      num = parseInt(color.slice(1), 16)
      amt = Math.round(2.55 * percent)
      R = (num >> 16) + amt
      G = (num >> 8 & 0x00ff) + amt
      B = (num & 0x0000ff) + amt
      "#" + (0x1000000 +
        ((if R < 255 then (if R < 1 then 0 else R) else 255)) * 0x10000 +
        ((if G < 255 then (if G < 1 then 0 else G) else 255)) * 0x100 +
        ((if B < 255 then (if B < 1 then 0 else B) else 255))
        ).toString(16).slice(1)

    applyFont = (font) ->
      body.setAttribute('isotope-ui-font', font)

    applyFontWeight = (weight) ->
      body.setAttribute('isotope-ui-fontweight', weight)

    applyCompactness = () ->
      if atom.config.get('isotope-ui.compactLayout')
        body.setAttribute('isotope-ui-compact', 'true')
      else
        body.setAttribute('isotope-ui-compact', 'false')

    applyTreeColor = () ->
      if atom.config.get('isotope-ui.colorTreeSelection')
        body.setAttribute('isotope-ui-treecolor', 'true')
      else
        body.setAttribute('isotope-ui-treecolor', 'false')

    applyBackgroundColor = () ->
      color =
        atom.config.get('isotope-ui.customBackgroundColorPicker').toHexString()
      if atom.config.get('isotope-ui.backgroundGradient')
        if atom.config.get('isotope-ui.customBackgroundColor')
          atom.config.set('isotope-ui.backgroundImage', 'false')
          color1 = shadeColor(color, 12)
          color2 = shadeColor(color, -12)
          gradient = 'linear-gradient(' + color1 + ' 0%, ' + color2 + ' 100%)'
          body.setAttribute('isotope-ui-bg-color', 'true')
          body.style.backgroundImage = gradient
        else
          body.setAttribute('isotope-ui-bg-color', 'false')
          body.style.backgroundImage = ''
      else
        body.style.backgroundImage = ''
        if atom.config.get('isotope-ui.customBackgroundColor')
          atom.config.set('isotope-ui.backgroundImage', 'false')
          body.setAttribute('isotope-ui-bg-color', 'true')
          body.style.backgroundColor = color
        else
          body.setAttribute('isotope-ui-bg-color', 'false')
          body.style.backgroundColor = ''

    applyBackgroundGradient = () ->
      if atom.config.get('isotope-ui.backgroundGradient')
        body.setAttribute('isotope-ui-bg-gradient', 'true')
        atom.config.set('isotope-ui.backgroundImage', 'false')
      else
        body.setAttribute('isotope-ui-bg-gradient', 'false')
        applyBackgroundImage()
      applyBackgroundColor()

    applyBackgroundImage = () ->
      if atom.config.get('isotope-ui.backgroundImage')
        atom.config.set('isotope-ui.customBackgroundColor', 'false')
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
        body.className =
          body.setAttribute('isotope-ui-tooltip-lowcontrast', 'true')
      else
        body.className =
          body.setAttribute('isotope-ui-tooltip-lowcontrast', 'false')


    # run when atom is ready


    applyFont(atom.config.get('isotope-ui.fontFamily'))
    applyFontWeight(atom.config.get('isotope-ui.fontWeight'))
    applyCompactness()
    applyTreeColor()
    applyBackgroundColor()
    applyBackgroundGradient()
    applyBackgroundImage()
    applyGutterStyle()
    applyTooltipContrast()


    # run when configs change

    atom.config.onDidChange 'isotope-ui.fontFamily', ->
      applyFont(atom.config.get('isotope-ui.fontFamily'))

    atom.config.onDidChange 'isotope-ui.fontWeight', ->
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))

    atom.config.onDidChange 'isotope-ui.compactLayout', ->
      applyCompactness()

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
