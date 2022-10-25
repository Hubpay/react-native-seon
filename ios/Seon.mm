#import "Seon.h"

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNSeonSpec.h"
#endif

@implementation Seon
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setSessionId:(NSString *)sessionId
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    [[SeonFingerprint sharedManager] setSessionId:sessionId];
    resolve(@YES);
}

RCT_EXPORT_METHOD(setLoggingEnabled:(BOOL)enabled
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    [[SeonFingerprint sharedManager] setLoggingEnabled:enabled];
    resolve(@YES);
}

RCT_EXPORT_METHOD(getFingerprintBase64:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
        [[SeonFingerprint sharedManager] fingerprintBase64With:^(NSString *seonFingerprint) {
              resolve(seonFingerprint);
        }];

    } @catch (NSException *e) {
        reject(@"fingerprintBase64With", @"Failed to get fingerprint", nil);
    }
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeSeonSpecJSI>(params);
}
#endif

@end
