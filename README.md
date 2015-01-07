# Isotope UI theme

A clean and low contrast UI theme that lets you focus on code.

Isotope relies on syntax-variables.less to set a background color, and derives all other colors from that. It's intended to provide an easy-on-the-eyes backdrop for your code, with well balanced typography, whitespace and contrast. The colors adjust to the syntax theme, but tends towards dark-ish. As soon as Isotope reaches a proper level of polish and elegance I plan to add controls for you to customize such variables as dark-ness and fonts.

Thanks to [@simurai](https://github.com/simurai) for the work on the [one-dark-ui](https://github.com/atom/one-dark-ui) theme that Isotope was forked from.

![dark](https://github.com/braver/isotope-ui/raw/master/resources/images/1.png)

![light](https://github.com/braver/isotope-ui/raw/master/resources/images/6.png)


## Features

- Automatically adapts to your favourite syntax theme
- Styled settings-view
- Tweaks atom-color-highlight end-of-line color hints
- Configurable!


## Configuration

- You can choose from a number of fonts included in this theme
- You can select hip 'thin' fonts, or trusty old 'regular'
- You can change font-sizes for the entire UI (everything will scale to fit) by putting this in your stylesheet:

```
html, body { font-size: 9px; }
```


## Fonts
I'm packaging a number of fonts that were designed especially for user interfaces with this theme. You can pick and choose without having to find and install anything:

- Cantarell - the system font for GNOME 3 (by Dave Crossland)
- Clear Sans - Intel's new font (by Daniel Ratighan)
- Fira Sans - the system font for Firefox OS (by Carrois and Edenspiekermann)
- Oxygen - the system font for KDE (by Vernon Adams)
- Roboto - the new font for Android (by Christian Robertson)
- Source Sans Pro - Adobe's UI font also used in Brackets (by Paul D. Hunt)
- Ubuntu - Ubuntu's system font (by Dalton Maag)
- Open Sans - because we ♥ Open Sans (by Steve Matteson)

## Plans

- Support tweaking saturation and contrast via settings-view (waiting for settings-view here)
s- Offer more font choices (currently packages Open Sans)
- Tweak and improve stuff for packages
- Use it every day
- Make it better almost every day
