const mix = require('laravel-mix');
const tailwindcss = require('tailwindcss');

// mix.postCss('resources/css/app.css', 'web/dist/css/app.css', [
//         tailwindcss('tailwind.config.js')
//     ]
// );

mix.setPublicPath('web/dist');
mix.setResourceRoot('./');

// JS compile
mix.js('resources/js/app.js', 'web/dist/js').version();
// SCSS compile
mix.sass('resources/sass/app.scss', 'web/dist/css').version();