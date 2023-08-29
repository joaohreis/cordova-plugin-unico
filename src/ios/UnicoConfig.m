#import "UnicoConfig.h"
#import <AcessoBio/AcessoBio-Swift.h>

@implementation UnicoConfig : NSObject 

- (NSString * _Nonnull)getBundleIdentifier {
    //return @"1571310558";  //HOMOLOG
	return @"1571310558";  //PROD
}

- (NSString * _Nonnull)getHostInfo {
    return @"nRMqSJJeWMZ0K4n9Dxs/Zhb5RslAxes+pmH0gJgmVtZImMYBRmw3bx3E0ehCDJnY";  //HOMOLOG
	//return @"Up4XTo9Enmc9krxVWOW2KkDIHFlJDv6AXGgf547UEGA=";  //PROD
}

- (NSString * _Nonnull)getHostKey {
    return @"r930Imj0FlHBf/Y8DGRIIYIxhU5SYVm9+nG+kgCNmKGmwmyWhRVuI9vbBHnf6Jfm";  //HOMOLOG
	//return @"U1wcQZnRZFj7bUN+grQEdHXuLJA6nmx87ZMQIYtisL2gPHGDY94xz/lHsJ39Eino";  //PROD
}

- (NSString * _Nonnull)getMobileSdkAppId {
    //return @"2:56:ios";  //HOMOLOG
	return @"2:56:ios";  //PROD
}

- (NSString * _Nonnull)getProjectId {
    return @"Bene.com.vc";
}

- (NSString * _Nonnull)getProjectNumber {
    return @"480761954839809349276448"; //HOMOLOG
	//return @"59251343440673415637318"; //PROD
}

@end