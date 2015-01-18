module.exports =

  apply: () ->

    # functions

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
      document.querySelector('body').setAttribute('isotope-ui-font', font)

    applyFontWeight = (weight) ->
      atom.workspaceView.attr('isotope-ui-fontweight', weight)

    applyCompactness = () ->
      if atom.config.get('isotope-ui.compactLayout')
        atom.workspaceView.addClass('isotope-ui-compact')
      else
        atom.workspaceView.removeClass('isotope-ui-compact')

    applyTreeColor = () ->
      if atom.config.get('isotope-ui.colorTreeSelection')
        atom.workspaceView.addClass('isotope-ui-treecolor')
      else
        atom.workspaceView.removeClass('isotope-ui-treecolor')

    applyBackgroundColor = () ->
      color = atom.config.get('isotope-ui.backgroundColor')
      if atom.config.get('isotope-ui.backgroundGradient')
        if color isnt ''
          color1 = shadeColor(color, 12)
          color2 = shadeColor(color, -12)
          gradient = 'linear-gradient(' + color1 + ' 0%, ' + color2 + ' 100%)'
          atom.workspaceView.addClass('isotope-ui-bg-color')
          atom.workspaceView.css(
            'backgroundImage',
            gradient
          )
        else
          atom.workspaceView.removeClass('isotope-ui-bg-color')
          atom.workspaceView.css(
            'backgroundImage',
            ''
          )
      else
        atom.workspaceView.css(
          'backgroundImage',
          ''
        )
        if color isnt ''
          atom.workspaceView.addClass('isotope-ui-bg-color')
          atom.workspaceView.css(
            'backgroundColor',
            color
          )
        else
          atom.workspaceView.removeClass('isotope-ui-bg-color')
          atom.workspaceView.css(
            'backgroundColor',
            ''
          )

    applyBackgroundGradient = () ->
      if atom.config.get('isotope-ui.backgroundGradient')
        atom.workspaceView.addClass('isotope-ui-bg-gradient')
        atom.config.set('isotope-ui.backgroundImage', 'false')
      else
        atom.workspaceView.removeClass('isotope-ui-bg-gradient')
      applyBackgroundColor()

    applyBackgroundImage = () ->
      if atom.config.get('isotope-ui.backgroundImage')
        atom.workspaceView.addClass('isotope-ui-bg-image')
        atom.config.set('isotope-ui.backgroundGradient', 'false')
        atom.workspaceView.css(
          'backgroundImage',
          'url(' + atom.config.get('isotope-ui.backgroundImagePath') + ')'
        )
      else
        atom.workspaceView.removeClass('isotope-ui-bg-image')
        atom.workspaceView.css(
          'backgroundImage',
          ''
        )

    applyGutterStyle = () ->
      if atom.config.get('isotope-ui.gutterStyle')
        atom.workspaceView.addClass('isotope-ui-gutter-style')
      else
        atom.workspaceView.removeClass('isotope-ui-gutter-style')

    applyTooltipContrast = () ->
      body = document.querySelector('body')
      if atom.config.get('isotope-ui.lowContrastTooltip')
        body.className =
          body.className + " " + 'isotope-ui-tooltip-lowcontrast'
      else
        body.className =
          body.className.replace(/\sisotope-ui-tooltip-lowcontrast/, '')

    # run when atom is ready

    atom.workspaceView.ready ->
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

    atom.config.onDidChange 'isotope-ui.backgroundColor', ->
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
