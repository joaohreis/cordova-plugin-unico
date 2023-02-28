#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>
#import <GLKit/GLKit.h>

@interface UnicoCheckModule : CDVPlugin

@property (nonatomic) bool hasListeners;

@property (nonatomic, copy) NSString *UnicoCallbackId;
- (void)init:(CDVInvokedUrlCommand*)command;

typedef NS_ENUM(NSInteger, CameraMode) {
  DEFAULT,
  SMART,
  LIVENESS,
  DOCUMENT_FRONT,
  DOCUMENT_BACK
};

- (void)startCameraLiveness: (CDVInvokedUrlCommand*)command;
- (void)onSucessCamera: (NSString *)msg;
- (void)onErrorCameraFace:(NSString *)error;
- (void)onErrorAcessoBioManager:(NSString *)error;
- (void)systemClosedCameraTimeoutFaceInference;
- (void)systemClosedCameraTimeoutSession;
- (void)userClosedCameraManually;

//- (void) greet:(CDVInvokedUrlCommand*)command;

@end

