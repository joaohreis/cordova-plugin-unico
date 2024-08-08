#import "UnicoCheckViewController.h"
#import "UnicoCheckModule.h"
#import <AcessoBio/AcessoBio-Swift.h>
#import "UnicoTheme.h"
#import "UnicoConfig.h"

@interface UnicoCheckViewController ()

@property (nonatomic, strong) NSString *jsonFileName;

@end

@implementation UnicoCheckViewController

//documentType = DocumentRGFrente;

- (void)viewDidLoad {
  [super viewDidLoad];

  self.jsonFileName = @"";

  unicoCheck = [[AcessoBioManager alloc] initWithViewController:self];
  // [unicoCheck setTheme:[[UnicoTheme alloc] init]];

  switch (_mode) {
    case SMART:
      [self performSelector:@selector(callSmartCamera) withObject:nil afterDelay:0.5];
      break;
    case LIVENESS:
      [self performSelector:@selector(callLivenessCamera) withObject:nil afterDelay:0.5];
      break;
    case CNH_FRONT:
      [self performSelector:@selector(callDocumentCNHFront)    withObject:nil afterDelay:0.5];
      break;
    case CNH_BACK:
      [self performSelector:@selector(callDocumentCNHBack) withObject:nil afterDelay:0.5];
      break;
	case RG_FRONT:
      [self performSelector:@selector(callDocumentRGFront)    withObject:nil afterDelay:0.5];
      break;
    case RG_BACK:
      [self performSelector:@selector(callDocumentRGBack) withObject:nil afterDelay:0.5];
      break;
	case OUT_FRONT:
      [self performSelector:@selector(callDocumentOUTFront)    withObject:nil afterDelay:0.5];
      break;
    case OUT_BACK:
      [self performSelector:@selector(callDocumentOUTBack) withObject:nil afterDelay:0.5];
      break;
  }
}


- (void)callSmartCamera {
  [unicoCheck setSmartFrame:true];
  [unicoCheck setAutoCapture:true];
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareSelfieCamera:self config: [UnicoConfig new]];
}

- (void)callLivenessCamera {
  NSLog(@"callLivenessCamera");
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareSelfieCamera:self config: [UnicoConfig new]];
}

- (void)callDocumentCNHFront {
  NSLog(@"callDocumentCNHFront");
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareDocumentCamera:self config: [UnicoConfig new]];
}

- (void)callDocumentCNHBack {
  NSLog(@"callDocumentCNHBack");
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareDocumentCamera:self config: [UnicoConfig new]];
}

- (void)callDocumentRGFront {
  NSLog(@"callDocumentRGFront");
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareDocumentCamera:self config: [UnicoConfig new]];
}

- (void)callDocumentRGBack {
  NSLog(@"callDocumentRGBack");
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareDocumentCamera:self config: [UnicoConfig new]];
}

- (void)callDocumentOUTFront {
  NSLog(@"callDocumentOUTFront");
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareDocumentCamera:self config: [UnicoConfig new]];
}

- (void)callDocumentOUTBack {
  NSLog(@"callDocumentOUTBack");
  [unicoCheck setTheme: [UnicoTheme new]];
  [[unicoCheck build] prepareDocumentCamera:self config: [UnicoConfig new]];
}

- (void)onErrorAcessoBioManager:(ErrorBio *)errorBio {
  NSLog(@"onErrorAcessoBioManager");
  [self.acessoBioModule onErrorAcessoBioManager:errorBio.code :errorBio.desc];
  [self sair];
}

- (void)onCameraReady:(id)cameraOpener {
  [cameraOpener open:self];
}

-(void)onCameraReadyDocument:(id<AcessoBioCameraOpenerDelegate>)cameraOpener  {
  NSLog(@"onCameraReadyDocument");
  
  switch (_mode) {
    
    case CNH_FRONT:
      [cameraOpener openDocument:DocumentCNHFrente delegate:self];
      break;
    case CNH_BACK:
      [cameraOpener openDocument:DocumentCNHVerso delegate:self];
      break;
	case RG_FRONT:
      [cameraOpener openDocument:DocumentRGFrente delegate:self];
      break;
    case RG_BACK:
      [cameraOpener openDocument:DocumentRGVerso delegate:self];
      break;
	case OUT_FRONT:
      [cameraOpener openDocument:DocumentNone delegate:self];
      break;
    case OUT_BACK:
      [cameraOpener openDocument:DocumentNone delegate:self];
      break;
	case SMART:
	case LIVENESS:
		NSLog(@"nao é documento");
		break;
  }
  
}

- (void)onCameraFailedDocument:(ErrorBio *)message{
  NSLog(@"onCameraFailedDocument");
  NSLog(@"%@", message.desc);
}

- (void)onCameraFailed:(ErrorBio *)message {
  NSLog(@"onCameraFailed");
  NSLog(@"%@", message.desc);
  [self.acessoBioModule onErrorSelfie:errorBio.code :errorBio.desc];
  [self.acessoBioModule onErrorSelfie:errorBio.code :message.desc];
  [self sair];
}

- (void)onSuccessSelfie:(SelfieResult *)result {
  NSLog(@"onSuccessSelfie");
  [self.acessoBioModule onSucessCamera:result.base64 :result.encrypted];
  [self sair];
}

- (void)onErrorSelfie:(ErrorBio *)errorBio {
  NSLog(@"onErrorSelfie");
  [self.acessoBioModule onErrorSelfie:errorBio.code :errorBio.desc];
  [self sair];
}

- (void)onSuccessDocument: (DocumentResult *)result {
  NSLog(@"onSuccessDocument");
  [self.acessoBioModule onSucessCamera:result.base64 :result.encrypted];
  [self sair];
}

- (void)onErrorDocument:(ErrorBio *)errorBio {
  NSLog(@"onErrorDocument");
  [self.acessoBioModule onErrorDocument:errorBio.code :errorBio.desc];
  [self sair];
}

- (void)onErrorCameraFace:(NSString *)error {
  NSLog(@"onErrorCameraFace");
  [self.acessoBioModule onErrorCameraFace:error];
  [self sair];
}

- (void)onSystemChangedTypeCameraTimeoutFaceInference {
  NSLog(@"onSystemChangedTypeCameraTimeoutFaceInference");
  [self.acessoBioModule systemClosedCameraTimeoutSession];
  [self sair];
}

- (void)onSystemClosedCameraTimeoutSession {
  NSLog(@"onSystemClosedCameraTimeoutSession");
  [self.acessoBioModule systemClosedCameraTimeoutSession];
  [self sair];
}

- (void)onUserClosedCameraManually {
  NSLog(@"onUserClosedCameraManually");
  [self.acessoBioModule userClosedCameraManually];
  [self sair];
}

- (void)sair{
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    [self dismissViewControllerAnimated:YES completion:nil];
  });
}

@end
