
#import "UnicoCheckModule.h"
#import "UnicoCheckViewController.h"

@interface UnicoCheckModule ()

@end

@implementation UnicoCheckModule

@synthesize UnicoCallbackId;

- (void) startCameraLiveness:(CDVInvokedUrlCommand*)command {

  CDVPluginResult *pluginResult;

	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"funcao startCameraLiveness"];

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
  
  [self callLivenessCamera];
  
}

- (void)init:(CDVInvokedUrlCommand*)command
{
  self.UnicoCallbackId = command.callbackId;
  NSLog(@"[objC] callbackId: %@", self.UnicoCallbackId);
  
  CDVPluginResult *pluginResult;
  
  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"funcao init"];

}

- (void)callDefaultCamera {
  [self openCamera:DEFAULT];
}


- (void)callSmartCamera {
  [self openCamera:SMART];
}


- (void)callLivenessCamera {
  [self openCamera:LIVENESS];
}


- (void)callDocumentFrontCamera {
  [self openCamera:DOCUMENT_FRONT];
}


- (void)callDocumentBackCamera {
  [self openCamera:DOCUMENT_BACK];
}

- (void)openCamera: (CameraMode)cameraMode {
  
  dispatch_async(dispatch_get_main_queue(), ^{
    
    UnicoCheckViewController *unicoView = [UnicoCheckViewController new];
    
    UIViewController *view = [UIApplication sharedApplication].delegate.window.rootViewController;
    unicoView.viewOrigin = view;
    unicoView.mode = cameraMode;
    unicoView.acessoBioModule = self;
    
    [view presentViewController:unicoView animated:YES completion:nil];
   
  });
}

// Will be called when this module's first listener is added.
-(void)startObserving {
    self.hasListeners = YES;
    // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
    self.hasListeners = NO;
    // Remove upstream listeners, stop unnecessary background tasks
}

- (void)onSucessCamera: (NSString *)msg {
  if(self.hasListeners) {
    //[self sendEventWithName:@"onSuccess" body:@{@"objResult": msg}];
	
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
  }  
}

- (void)onErrorCameraFace:(NSString *)error {
  if(self.hasListeners) {
    //[self sendEventWithName:@"onError" body:@{@"objResult": error}];
	CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:error];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
  }
}

- (void)onErrorAcessoBioManager:(NSString *)error {
  if (self.hasListeners) {
    //[self sendEventWithName:@"onError" body:@{@"objResult": error}];
	CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:error];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
  }
}

- (void)systemClosedCameraTimeoutFaceInference {
  //[self sendEventWithName:@"onError" body:@{@"objResult": @"Timeout de inferencia inteligente de face excedido."}];
  NSString* msg = [NSString stringWithFormat: @"Timeout de inferencia inteligente de face excedido."];
  CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:msg];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
}

- (void)systemClosedCameraTimeoutSession {
  //[self sendEventWithName:@"onError" body:@{@"objResult": @"Tempo de sessão excedido"}];
  NSString* msg = [NSString stringWithFormat: @"Tempo de sessão excedido"];
  CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:msg];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
}

- (void)userClosedCameraManually {
  if(self.hasListeners) {
    //[self sendEventWithName:@"onError" body:@{@"objResult": @"Usuário fechou a câmera manualmente"}];
	NSString* msg = [NSString stringWithFormat: @"Usuário fechou a câmera manualmente"];
	CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:msg];

    [self.commandDelegate sendPluginResult:result callbackId:self.UnicoCallbackId];
  }
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


