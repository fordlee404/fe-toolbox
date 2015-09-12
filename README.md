# fe-toolbox
A docker image for front-end toolbox

## Include tools

* [NodeJS](http://nodejs.org) `version: 4.0.0`
* [npm](https://www.npmjs.com) `version: 2.14.2`
* [Yeoman](http://yeoman.io)
* [Bower](http://bower.io)
* [Grunt](http://gruntjs.com)
* [Gulp](http://gulpjs.com)
* [Webpack](http://webpack.github.io)
* [webpack-dev-server](http://webpack.github.io/docs/webpack-dev-server.html)
* [Compass](http://compass-style.org)

## VOLUME

`/home/root/project`

## WORKDIR

`/home/root/project`

## Example

`$ docker run -it --name grunt -v ~/project:/home/root/project fordlee404/fe-toolbox grunt`
