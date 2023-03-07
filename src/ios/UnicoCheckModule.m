
#import "UnicoCheckModule.h"
#import "UnicoCheckViewController.h"

@implementation UnicoCheckModule

NSString *msg_error;
typedef void (^Callback)(NSString* response);

- (void) startCameraSmart:(CDVInvokedUrlCommand*)command {
	//self.UnicoCallbackId = command.callbackId;
	[self openCamera:SMART :successCallback :errorCallback];
}

- (void) startCameraLiveness:(CDVInvokedUrlCommand*)command {
	//self.UnicoCallbackId = command.callbackId;  
	[self openCamera:LIVENESS :successCallback :errorCallback];
}

- (void) startCameraCNHFront:(CDVInvokedUrlCommand*)command {
	//self.UnicoCallbackId = command.callbackId;
	[self openCamera:CNH_FRONT :successCallback :errorCallback];
}

- (void) startCameraCNHBack:(CDVInvokedUrlCommand*)command {
	//self.UnicoCallbackId = command.callbackId;
	[self openCamera:CNH_BACK :successCallback :errorCallback];
}

- (void) startCameraRGFront:(CDVInvokedUrlCommand*)command {
	//self.UnicoCallbackId = command.callbackId;  
	[self openCamera:RG_FRONT :successCallback :errorCallback];
}

- (void) startCameraRGBack:(CDVInvokedUrlCommand*)command {
	//self.UnicoCallbackId = command.callbackId;  
	[self openCamera:RG_FRONT :successCallback :errorCallback];
}

- (void) startCameraOUTFront:(CDVInvokedUrlCommand*)command { 
	
	NSString *callbackId = command.callbackId;
	
	[self openCamera:OUT_FRONT :successCallback :errorCallback];
    
	/*
	msg_error = @"Usuário fechou a câmera manualmente";
	
	CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:msg_error];
	[self.commandDelegate sendPluginResult:result callbackId:callbackId];
	
	//[self userClosedCameraManually];
	*/
}

- (void) startCameraOUTBack:(CDVInvokedUrlCommand*)command {
	//self.UnicoCallbackId = command.callbackId;  
	[self openCamera:OUT_BACK :successCallback :errorCallback];
}

- (void)openCamera: (CameraMode)cameraMode :(Callback)successCallback :(Callback)errorCallback{
  
  dispatch_async(dispatch_get_main_queue(), ^{
    
    UnicoCheckViewController *unicoView = [UnicoCheckViewController new];
    
    UIViewController *view = [UIApplication sharedApplication].delegate.window.rootViewController;
    unicoView.viewOrigin = view;
    unicoView.mode = cameraMode;
    unicoView.acessoBioModule = self;
    
    [view presentViewController:unicoView animated:YES completion:nil];
	
   
  });
}

- (void)onSucessCamera: (NSString *)msg {
  
    //[self sendEventWithName:@"onSuccess" body:@{@"objResult": msg}];
	/*
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];
	[result setKeepCallbackAsBool:YES];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
    */
}

- (void)onErrorCameraFace:(NSString *)error {
  /*
    //[self sendEventWithName:@"onError" body:@{@"objResult": error}];
	CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:error];
	[result setKeepCallbackAsBool:YES];							   

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
  */
}

- (void)onErrorAcessoBioManager:(NSString *)error {
  /*
    //[self sendEventWithName:@"onError" body:@{@"objResult": error}];
	CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:error];

	[result setKeepCallbackAsBool:YES];
	
    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
  */
}

- (void)systemClosedCameraTimeoutFaceInference {
 /* //[self sendEventWithName:@"onError" body:@{@"objResult": @"Timeout de inferencia inteligente de face excedido."}];
  NSString* msg = [NSString stringWithFormat: @"Timeout de inferencia inteligente de face excedido."];
  CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:msg];

	[result setKeepCallbackAsBool:YES];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
	*/
}

- (void)systemClosedCameraTimeoutSession {
	/*
	//[self sendEventWithName:@"onError" body:@{@"objResult": @"Tempo de sessão excedido"}];
	NSString* msg = [NSString stringWithFormat: @"Tempo de sessão excedido"];
	CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:msg];

	[result setKeepCallbackAsBool:YES];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
	*/
}

- (void)userClosedCameraManually {

	
	/*
    //[self sendEventWithName:@"onError" body:@{@"objResult": @"Usuário fechou a câmera manualmente"}];
	NSString* msg = [NSString stringWithFormat: @"Usuário fechou a câmera manualmente"];
	CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:msg];

	[result setKeepCallbackAsBool:YES];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
  */
  
	
		msg_error = @"Usuário fechou a câmera manualmente";
			
		CDVPluginResult* result = [CDVPluginResult
							   resultWithStatus:CDVCommandStatus_ERROR
							   messageAsString:msg_error];
		[result setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId.callbackId];
    
	/*
	NSString *mensagem = [[NSString alloc] initWithFormat:@"UnicoCallbackId 2: %@", self.UnicoCallbackId];

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait" message:mensagem delegate:self cancelButtonTitle:@"Delete" otherButtonTitles:@"Cancel", nil];
	[alert show];
	*/
}

-(void)showAlert{
  
  UIAlertController *alert = [UIAlertController new];
  alert.title = @"teste";
  alert.message = @"descriptiuon";
  
  dispatch_async(dispatch_get_main_queue(), ^{
    UIViewController *view = [UIApplication sharedApplication].delegate.window.rootViewController;
    [view presentViewController:alert animated:YES completion:nil];
    
  });
  
}

// MARK: - Supported Events

- (NSArray<NSString *> *)supportedEvents {
  return @[@"onSuccess", @"onError"];
}

@end


