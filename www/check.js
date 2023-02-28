var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');

var PLUGIN_NAME = "UnicoCheckModule";

var UnicoCheckModule = function() {};

UnicoCheckModule.startCameraSmart = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraSmart", []);
	console.log("startCameraSmart");
}

UnicoCheckModule.startCameraLiveness = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraLiveness", []);
	console.log("startCameraLiveness");
	alert("startCameraLiveness");
}

UnicoCheckModule.startCameraCNHFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraCNHFront", []);
	console.log("startCameraCNHFront");
}

UnicoCheckModule.startCameraCNHBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraCNHBack", []);
	console.log("startCameraCNHBack");
}

UnicoCheckModule.startCameraRGFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraRGFront", []);
	console.log("startCameraRGFront");
}

UnicoCheckModule.startCameraRGBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraRGBack", []);
	console.log("startCameraRGBack");
}

UnicoCheckModule.startCameraOUTFront = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraOUTFront", []);
	console.log("startCameraOUTFront");
}

UnicoCheckModule.startCameraOUTBack = function (successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "startCameraOUTBack", []);
	console.log("startCameraOUTBack");
}
			
module.exports = UnicoCheckModule;

