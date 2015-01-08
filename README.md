# Isotope UI theme

A clean and low contrast UI theme that adapts to your favourite syntax theme.

Isotope relies on syntax-variables.less to set a background color, and derives all other colors from that. It's intended to provide an easy-on-the-eyes backdrop for your code, with well balanced typography, whitespace and contrast.

You can configure typography and a number of other options to your liking.

Thanks to [@simurai](https://github.com/simurai) for the work on the [one-dark-ui](https://github.com/atom/one-dark-ui) theme that Isotope was forked from.

![dark](https://github.com/braver/isotope-ui/raw/master/resources/images/1.png)

![light](https://github.com/braver/isotope-ui/raw/master/resources/images/6.png)

[More examples](https://github.com/braver/isotope-ui/blob/master/resources/images/examples.md)

## Features

- Automatically adapts to your favourite syntax theme
- Styled settings-view
- Configurable!


## Configuration

- Choose from a number of fonts included in this theme
- Select hip 'thin' fonts, or trusty old 'regular'
- Make the layout take up less vertical space (e.g. for small screens)
- Choose tree-view selected item highlight color
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
- Oxygen - the system font for KDE (by Vernon Adams)
- Roboto - the new font for Android (by Christian Robertson)
- Source Sans Pro - Adobe's UI font also used in Brackets (by Paul D. Hunt)
- Ubuntu - Ubuntu's system font (by Dalton Maag)

## Plans

- Support tweaking saturation and contrast via settings-view (waiting for settings-view here)
- Offer more font choices
- Tweak and improve stuff for packages
- Add more configuration options
- Use it every day
- Make it better almost every day
