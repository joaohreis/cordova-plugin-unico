
#import "UnicoCheckModule.h"
#import "UnicoCheckViewController.h"

@implementation UnicoCheckModule

NSString *msg_error;

- (void) sendEventError:(NSString*)data :(NSString*)callbackId {
	NSTimeInterval delayInSeconds = 1.5;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:data];
		[result setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:result callbackId:callbackId];
	});
}

- (void) sendEventSucesso:(NSString*)data64 :(NSString*)jwt :(NSString*)callbackId {
	
	NSMutableDictionary* resultDict = [NSMutableDictionary new];
    resultDict[@"data64"] = data64;
    resultDict[@"jwt"] = jwt;

	NSTimeInterval delayInSeconds = 1.5;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		CDVPluginResult* result = [CDVPluginResult
								   resultWithStatus: CDVCommandStatus_OK
								   messageAsDictionary: resultDict
								   ];
		[result setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:result callbackId:callbackId];
	});
}

- (void) startCameraSmart:(CDVInvokedUrlCommand*)command {
	self.UnicoCallbackId = command.callbackId;
	[self openCamera:SMART];
}

- (void) startCameraLiveness:(CDVInvokedUrlCommand*)command {
	self.UnicoCallbackId = command.callbackId;  
	[self openCamera:LIVENESS];
}

- (void) startCameraCNHFront:(CDVInvokedUrlCommand*)command {
	self.UnicoCallbackId = command.callbackId;
	[self openCamera:CNH_FRONT];
}

- (void) startCameraCNHBack:(CDVInvokedUrlCommand*)command {
	self.UnicoCallbackId = command.callbackId;
	[self openCamera:CNH_BACK];
}

- (void) startCameraRGFront:(CDVInvokedUrlCommand*)command {
	self.UnicoCallbackId = command.callbackId;
	[self openCamera:RG_FRONT];
}

- (void) startCameraRGBack:(CDVInvokedUrlCommand*)command {
	self.UnicoCallbackId = command.callbackId;
	[self openCamera:RG_FRONT];
}

- (void) startCameraOUTFront:(CDVInvokedUrlCommand*)command { 
	self.UnicoCallbackId = command.callbackId;
	[self openCamera:OUT_FRONT];
}

- (void) startCameraOUTBack:(CDVInvokedUrlCommand*)command {
	self.UnicoCallbackId = command.callbackId;  
	[self openCamera:OUT_BACK];
}

- (void)openCamera: (CameraMode)cameraMode {
  
  dispatch_async(dispatch_get_main_queue(), ^{
    
    UnicoCheckViewController *unicoView = [UnicoCheckViewController new];
    
    UIViewController *view = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    unicoView.viewOrigin = view;
    unicoView.mode = cameraMode;
    unicoView.acessoBioModule = self;
    
    [view presentViewController:unicoView animated:YES completion:nil];
   
  });
}

- (void)onSucessCamera: (NSString *)data64 :(NSString *)jwt  {
  
	[self sendEventSucesso:data64 :jwt :self.UnicoCallbackId];
}

- (void)onErrorCameraFace:(NSString *)error {
	[self sendEventError:error :self.UnicoCallbackId];
}

- (void)onErrorAcessoBioManager:(NSInteger *)code :(NSString *)desc {
	NSString *str = [NSString stringWithFormat: @"%@ | %@", code, desc];
	[self sendEventError:str :self.UnicoCallbackId];
}

- (void)systemClosedCameraTimeoutFaceInference {
	msg_error = @"2 | Timeout de inferencia inteligente de face excedido.";
	[self sendEventError:msg_error :self.UnicoCallbackId];
}

- (void)systemClosedCameraTimeoutSession {
	msg_error = @"3 | Tempo de sessão excedido";
	[self sendEventError:msg_error :self.UnicoCallbackId];
}

- (void)userClosedCameraManually {
	msg_error = @"4 | Usuário fechou a câmera manualmente";
	[self sendEventError:msg_error :self.UnicoCallbackId];	
}

- (void)onErrorSelfie:(NSInteger *)code :(NSString *)desc {
	//NSString *str = [NSString stringWithFormat: @"%@ | %@", code, desc];
	NSString *str = [NSString stringWithFormat: @"1 | %@", desc];
	[self sendEventError:str :self.UnicoCallbackId];
}

- (void)onErrorDocument:(NSInteger *)code :(NSString *)desc {
	//NSString *str = [NSString stringWithFormat: @"%@ | %@", code, desc];
	NSString *str = [NSString stringWithFormat: @"0 | %@", desc];
	[self sendEventError:str :self.UnicoCallbackId];
}

// MARK: - Supported Events

- (NSArray<NSString *> *)supportedEvents {
  return @[@"onSuccess", @"onError"];
}

@end


