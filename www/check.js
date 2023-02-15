var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');

var PLUGIN_NAME = "UnicoCheckModule";

var check = function() {};

check.startCameraSmart = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraSmart", []);
	console.log("startCameraSmart");
}

check.startCameraLiveness = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraLiveness", []);
	console.log("startCameraLiveness");
}

check.startCameraCNHFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraCNHFront", []);
	console.log("startCameraCNHFront");
}

check.startCameraCNHBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraCNHBack", []);
	console.log("startCameraCNHBack");
}

check.startCameraRGFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraRGFront", []);
	console.log("startCameraRGFront");
}

check.startCameraRGBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraRGBack", []);
	console.log("startCameraRGBack");
}

check.startCameraOUTFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraOUTFront", []);
	console.log("startCameraOUTFront");
}

check.startCameraOUTBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraOUTBack", []);
	console.log("startCameraOUTBack");
}
			
module.exports = check;
