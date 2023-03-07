#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>
#import <GLKit/GLKit.h>

@interface UnicoCheckModule : CDVPlugin;

@property (class) CDVInvokedUrlCommand* _Nullable command;

//@property (nonatomic, strong) CDVInvokedUrlCommand* UnicoCallbackId;

typedef NS_ENUM(NSInteger, CameraMode) {
	SMART,
	LIVENESS,
	CNH_FRONT,
	CNH_BACK,
	RG_FRONT,
	RG_BACK,
	OUT_FRONT,
	OUT_BACK
};

- (void) startCameraSmart:(CDVInvokedUrlCommand*)command;
- (void) startCameraLiveness:(CDVInvokedUrlCommand*)command;
- (void) startCameraCNHFront:(CDVInvokedUrlCommand*)command;
- (void) startCameraCNHBack:(CDVInvokedUrlCommand*)command;
- (void) startCameraRGFront:(CDVInvokedUrlCommand*)command;
- (void) startCameraRGBack:(CDVInvokedUrlCommand*)command;
- (void) startCameraOUTFront:(CDVInvokedUrlCommand*)command;
- (void) startCameraOUTBack:(CDVInvokedUrlCommand*)command;

- (void)onSucessCamera: (NSString *)msg;
- (void)onErrorCameraFace:(NSString *)error;
- (void)onErrorAcessoBioManager:(NSString *)error;
- (void)systemClosedCameraTimeoutFaceInference;
- (void)systemClosedCameraTimeoutSession;
- (void)userClosedCameraManually;

- (void) sendEvent:(NSString*_Nullable)data :(NSString*_Nonnull)callbackId;

//- (void) greet:(CDVInvokedUrlCommand*)command;

@end

