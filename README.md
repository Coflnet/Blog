# 11ty Netlify Jumpstart

> Created by Stephanie Eckles ([@5t3ph](https://twitter.com/5t3ph))

Visit [11ty-netlify-jumpstart.netlify.app](https://11ty-netlify-jumpstart.netlify.app/) for all the feature details - or go ahead and [generate a new repo from the template](https://github.com/5t3ph/11ty-netlify-jumpstart/generate) to view the information locally.

## Quick Start

1. [Generate a repo from this template](https://github.com/5t3ph/11ty-netlify-jumpstart/generate) which will copy this project into your own new repo _if you are currently signed in to GitHub_. Alternatively, [visit the repo directly](https://github.com/5t3ph/11ty-netlify-jumpstart).

1. Once cloned, run `npm install` to install 11ty and other dependencies. Then run `npm start` to run 11ty in watch mode. Use `npm run build` to run a production version.

1. Open `src/_data/meta.js` and adjust the values to your details.

1. Review the [styling documentation](https://5t3ph.github.io/html-sass-jumpstart/) for the included minimal Sass framework, particularly the theme variables, to quickly customize the starter.

1. Edit `src/index.njk` to change the home page - including changing the template type if desired - and then create content within `_pages` using any templating format you prefer to add content.

1. Check out the [About page](https://11ty-netlify-jumpstart.netlify.app/about/) for expanded details on included features of this starter.

1. Review the [11ty documentation](https://11ty.dev) to more deeply apply customizations, including adding custom data sources and reviewing what template languages are available.

### Is Netlify hosting required?

It's not required, but highly recommended, and is also how the build process is setup to run.

## Development Scripts

**`npm start`**

> Run 11ty with hot reload at localhost:8080

**`npm run build`**

> Production build includes minified, autoprefixed CSS and social preview image generation

Use this as the "Publish command" if needed by hosting such as Netlify.

## Feedback welcome!

You can [file it as an issue](https://github.com/5t3ph/11ty-netlify-jumpstart/issues).

[![Buy me a coffee](https://cdn.buymeacoffee.com/buttons/default-violet.png)](https://www.buymeacoffee.com/moderncss)

## Changes in v2

For those that have use this starter before, you should know the following changes:

- removal of social media images - due to issues with packages for creating the images
- removal of stylelint
- update to use [@11tyrocks/eleventy-plugin-sass-lightningcss](https://www.npmjs.com/package/@11tyrocks/eleventy-plugin-sass-lightningcss) for Sass processing

