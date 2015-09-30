// var app = require('app');  // Module to control application life.
// var BrowserWindow = require('browser-window');  // Module to create native browser window.
var fs = require('fs')
// var packageFile = require('./package.json');

var coffee = require('coffee-script');
// console.log(coffee);
require('crash-reporter').start();
var coffeePath='./lib/', jsPath='./src/'

compileToCoffe = function(file_path,file_name) {
  // console.log("compileToCoffe: "+file_path+" name: "+file_name);
  var file_name_js = file_name.slice(0,file_name.length-7)+'.js';
  // console.log(file_name_js);
  var data=fs.readFileSync(file_path,'utf8');
  fs.writeFileSync(jsPath+file_name_js,coffee.compile(data));
};

files = fs.readdirSync(coffeePath);
for(var i=0;i<files.length;i++) {
  var file = files[i];
  // console.log("compile: "+file);
  compileToCoffe(coffeePath+file,file);
}

//Start src/main.js (lib/main.coffee)
require(jsPath+'main.js')
