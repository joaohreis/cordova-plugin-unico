/*global cordova, module*/

module.exports = {
    startCameraSmart: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraSmart", []);
    }
	
	startCameraLiveness: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraLiveness", []);
    }
	
	startCameraCNHFront: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraCNHFront", []);
    }
	
	startCameraCNHBack: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraCNHBack", []);
    }
	
	startCameraRGFront: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraRGFront", []);
    }
	
	startCameraRGBack: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraRGBack", []);
    }
	
	startCameraOUTFront: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraOUTFront", []);
    }
	
	startCameraOUTBack: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraOUTBack", []);
    }
			
};
