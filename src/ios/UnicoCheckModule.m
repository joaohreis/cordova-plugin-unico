
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>
#import <GLKit/GLKit.h>
#import "UnicoCheckModule.h"
#import "UnicoCheckViewController.h"

@implementation UnicoCheckModule


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
    hasListeners = YES;
    // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
    hasListeners = NO;
    // Remove upstream listeners, stop unnecessary background tasks
}

- (void)onSucessCamera: (NSString *)msg {
  if(hasListeners) {
    [self sendEventWithName:@"onSuccess" body:@{@"objResult": msg}];
  }  
}

- (void)onErrorCameraFace:(NSString *)error {
  if(hasListeners) {
    [self sendEventWithName:@"onError" body:@{@"objResult": error}];
  }
}

- (void)onErrorAcessoBioManager:(NSString *)error {
  if (hasListeners) {
    [self sendEventWithName:@"onError" body:@{@"objResult": error}];
  }
}

- (void)systemClosedCameraTimeoutFaceInference {
  [self sendEventWithName:@"onError" body:@{@"objResult": @"Timeout de inferencia inteligente de face excedido."}];
}

- (void)systemClosedCameraTimeoutSession {
  [self sendEventWithName:@"onError" body:@{@"objResult": @"Tempo de sessão excedido"}];
}

- (void)userClosedCameraManually {
  if(hasListeners) {
    [self sendEventWithName:@"onError" body:@{@"objResult": @"Usuário fechou a câmera manualmente"}];
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


