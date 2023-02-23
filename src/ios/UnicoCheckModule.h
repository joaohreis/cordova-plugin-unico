#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>

@interface UnicoCheckModule : CDVPlugin

bool hasListeners;

typedef NS_ENUM(NSInteger, CameraMode) {
  DEFAULT,
  SMART,
  LIVENESS,
  DOCUMENT_FRONT,
  DOCUMENT_BACK
};

- (void)onSucessCamera: (NSString *)msg;
- (void)onErrorCameraFace:(NSString *)error;
- (void)onErrorAcessoBioManager:(NSString *)error;
- (void)systemClosedCameraTimeoutFaceInference;
- (void)systemClosedCameraTimeoutSession;
- (void)userClosedCameraManually;

//- (void) greet:(CDVInvokedUrlCommand*)command;

@end

