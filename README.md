# fe-toolbox
A docker image for FE toolbox

## Include tools

* [NodeJS](http://nodejs.org) `version: 0.10.40`
* [npm](https://www.npmjs.com) `version: 2.11.3`
* [Yeoman](http://yeoman.io)
* [Bower](http://bower.io)
* [Grunt](http://gruntjs.com)
* [Gulp](http://gulpjs.com)
* [Webpack](http://webpack.github.io)
* [webpack-dev-server](http://webpack.github.io/docs/webpack-dev-server.html)
* [Compass](http://compass-style.org)

## VOLUME

`/home/dev/share`

## WORKDIR

`/home/dev/share`

## Example

`$ docker run -it --name grunt -v ~/project:/home/dev/share fordlee404/fe-toolbox grunt`
