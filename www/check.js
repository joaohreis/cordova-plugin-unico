var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');

var PLUGIN_NAME = "UnicoCheckModule";

var check = function() {};

function isFunction(obj) {
  return !!(obj && obj.constructor && obj.call && obj.apply);
};


check.startCameraSmart = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraSmart", []);
}

check.startCameraLiveness = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraLiveness", []);
}

check.startCameraCNHFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraCNHFront", []);
}

check.startCameraCNHBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraCNHBack", []);
}

check.startCameraRGFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraRGFront", []);
}

check.startCameraRGBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraRGBack", []);
}

check.startCameraOUTFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraOUTFront", []);
}

check.startCameraOUTBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraOUTBack", []);
}
			
module.exports = check;
