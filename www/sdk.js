/*global cordova, module*/

module.exports = {
    startCameraDocumento: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraDocumento");
    }
	
	startCameraSelfie: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "UnicoCheckModule", "startCameraSelfie");
    }
};
