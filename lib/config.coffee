module.exports =

  apply: () ->

    #functions

    applyFont = (font) ->
      atom.workspaceView.attr('isotope-ui-font', font)

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

    applyBackgroundGradient = () ->
      if atom.config.get('isotope-ui.backgroundGradient')
        atom.workspaceView.addClass('isotope-ui-bg-gradient')
        atom.config.set('isotope-ui.backgroundImage', 'false')
      else
        atom.workspaceView.removeClass('isotope-ui-bg-gradient')

    applyBackgroundImage = () ->
      if atom.config.get('isotope-ui.backgroundImage')
        atom.workspaceView.addClass('isotope-ui-bg-image')
        atom.config.set('isotope-ui.backgroundGradient', 'false')
        atom.workspaceView.css(
          'backgroundImage',
          'url(' + atom.config.get('isotope-ui.backgroundImageUrl') + ')'
        )
      else
        atom.workspaceView.removeClass('isotope-ui-bg-image')
        atom.workspaceView.css(
          'backgroundImage',
          ''
        )

    # run when atom is ready
    
    atom.workspaceView.ready ->
      applyFont(atom.config.get('isotope-ui.fontFamily'))
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))
      applyCompactness()
      applyTreeColor()
      applyBackgroundGradient()
      applyBackgroundImage()


    # run when configs change

    atom.config.onDidChange 'isotope-ui.fontFamily', ->
      applyFont(atom.config.get('isotope-ui.fontFamily'))

    atom.config.onDidChange 'isotope-ui.fontWeight', ->
      applyFontWeight(atom.config.get('isotope-ui.fontWeight'))

    atom.config.onDidChange 'isotope-ui.compactLayout', ->
      applyCompactness()

    atom.config.onDidChange 'isotope-ui.colorTreeSelection', ->
      applyTreeColor()

    atom.config.onDidChange 'isotope-ui.backgroundGradient', ->
      applyBackgroundGradient()

    atom.config.onDidChange 'isotope-ui.backgroundImage', ->
      applyBackgroundImage()

    atom.config.onDidChange 'isotope-ui.backgroundImageUrl', ->
      applyBackgroundImage()
