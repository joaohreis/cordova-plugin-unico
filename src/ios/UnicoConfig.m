#import "UnicoConfig.h"
#import <AcessoBio/AcessoBio-Swift.h>

///Esta classe é um exemplo de como implementar o AcessoBioConfigDataSource, entretanto é preferível que esses dados venham de algum Remote Config ou Backend.

@implementation UnicoConfig : NSObject 


- (NSString * _Nonnull)getBundleIdentifier {
    return @"1571310558";
}

- (NSString * _Nonnull)getHostInfo {
    return @"nRMqSJJeWMZ0K4n9Dxs/Zhb5RslAxes+pmH0gJgmVtZImMYBRmw3bx3E0ehCDJnY";
}

- (NSString * _Nonnull)getHostKey {
    return @"r930Imj0FlHBf/Y8DGRIIYIxhU5SYVm9+nG+kgCNmKGmwmyWhRVuI9vbBHnf6Jfm";
}

- (NSString * _Nonnull)getMobileSdkAppId {
    return @"2:56:ios";
}

- (NSString * _Nonnull)getProjectId {
    return @"Bene.com.vc";
}

- (NSString * _Nonnull)getProjectNumber {
    return @"480761954839809349276448";
}

@end