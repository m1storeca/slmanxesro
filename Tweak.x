#import <UIKit/UIKit.h>

%hook AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL result = %orig;

    // پیشاندانی دایەلۆگ دوای ٢ چرکە بۆ ئەوەی بەرنامەکە بە جوانی کرابێتەوە
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                    message:@"\n بەخێرهاتن \n\n ئەم بەرنامەیە لە لایەن M1StoreCa درووست کراوە"
                                    preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *telegram = [UIAlertAction actionWithTitle:@"Join Telegram"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/M1StoreCa"] options:@{} completionHandler:nil];
        }];

        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"باشە" style:UIAlertActionStyleCancel handler:nil];

        [alert addAction:telegram];
        [alert addAction:ok];

        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });

    return result;
}

%end
