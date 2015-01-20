# Isotope UI theme

A clean and configurable UI theme that adapts to your taste, offering endless possibilities. One Atom, many Isotopes ;)

Isotope relies on syntax-variables.less to set a background color, and derives all other colors from that. It's intended to provide an easy-on-the-eyes backdrop for your code, with well balanced typography, whitespace and contrast.

It's also flexible: you can configure typography, background (images even) and a number of other options to your liking.

Thanks to [@simurai](https://github.com/simurai) for the work on the [one-dark-ui](https://github.com/atom/one-dark-ui) theme that Isotope was forked from.

![flat background](https://github.com/braver/isotope-ui/raw/master/resources/images/flat.png)

![gradient background](https://github.com/braver/isotope-ui/raw/master/resources/images/gradient.png)

![image background](https://github.com/braver/isotope-ui/raw/master/resources/images/image.png)

[More examples](https://github.com/braver/isotope-ui/blob/master/resources/images/examples.md)

## Features

- Automatically adapts to your favourite syntax theme
- Tweaks [minimap](https://atom.io/packages/minimap), [zen](https://atom.io/packages/zen), [color-highlight](https://atom.io/packages/atom-color-highlight) (more to come)
- Configurable!


## Configuration

- Choose from a number of fonts included in this theme
- Select hip 'thin' fonts, or trusty old 'regular'
- Choose between a flat or gradient background
- Or even use any image as background (from your computer or [the internets](http://hubblesite.org))
- Make the layout take up less vertical space (e.g. for small screens)
- Choose tree-view highlight color
- Style the gutter, or not
- Choose low contrast tooltips (or fancy colorful ones)
- Change font-sizes for the entire UI (everything will scale to fit) by putting this in your stylesheet:

```
html, body { font-size: 9px; }
```


## Fonts
This package includes a number of fonts that were designed especially for user interfaces. You can pick and choose without having to find and install anything:

- Cantarell - the system font for GNOME 3 (by Dave Crossland)
- Clear Sans - Intel's new font (by Daniel Ratighan)
- Fira Sans - the system font for Firefox OS (by Carrois and Edenspiekermann)
- Open Sans - because we ♥ Open Sans (by Steve Matteson)
- Oxygen - the system font for KDE (by Vernon Adams)
- Roboto - the new font for Android (by Christian Robertson)
- Source Sans Pro - Adobe's UI font also used in Brackets (by Paul D. Hunt)
- Ubuntu - Ubuntu's system font (by Dalton Maag)
- System default - Attempts to match your OS using this stack: 'Helvetica Neue', 'Segoe UI', Ubuntu, Cantarell, sans-serif

## Plans

- Add config for brightness and contrast
- Tweak and improve stuff for specific packages
- Use it every day
- [Make it better almost every day](https://github.com/braver/isotope-ui/issues/2)
