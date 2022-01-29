//
//  ViewController.m
//  NativeAdTest
//
//  Created by VIGNESH on 27/04/21.
//

#import "ViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>


#import "NativeTemplates/GADTSmallTemplateView.h"
#import "NativeTemplates/GADTTemplateView.h"



@interface ViewController ()<GADNativeAdLoaderDelegate,
GADVideoControllerDelegate,
GADNativeAdDelegate>

@property(nonatomic, strong) GADAdLoader *adLoader;
@property(nonatomic, strong) GADNativeAdView *nativeAdView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    GADMultipleAdsAdLoaderOptions *multipleAdsOptions =
          [[GADMultipleAdsAdLoaderOptions alloc] init];
      multipleAdsOptions.numberOfAds = 5;
    
    self.adLoader = [[GADAdLoader alloc] initWithAdUnitID:@"ca-app-pub-3940256099942544/3986624511"
                                         rootViewController:self
                                                    adTypes:@[ kGADAdLoaderAdTypeNative ]
                                                    options:@[ multipleAdsOptions ]];
    
    self.adLoader.delegate = self;
    
    [self.adLoader loadRequest:[GADRequest request]];
    
    


}

#pragma mark GADAdLoaderDelegate implementation

- (void)adLoader:(GADAdLoader *)adLoader
    didReceiveNativeAd:(GADNativeAd *)nativeAd {
    NSLog(@"ad123 received");
    
    GADTSmallTemplateView *templateView = [[GADTSmallTemplateView alloc] init];
    _nativeAdView = templateView;
    nativeAd.delegate = self;

    
    [self.view addSubview:templateView];
    
    NSString *myBlueColor = @"#5C84F0";
    NSDictionary *styles = @{
        GADTNativeTemplateStyleKeyCallToActionFont : [UIFont systemFontOfSize:15.0],
        GADTNativeTemplateStyleKeyCallToActionFontColor : UIColor.whiteColor,
        GADTNativeTemplateStyleKeyCallToActionBackgroundColor :
            [GADTTemplateView colorFromHexString:myBlueColor],
        GADTNativeTemplateStyleKeySecondaryFont : [UIFont systemFontOfSize:15.0],
        GADTNativeTemplateStyleKeySecondaryFontColor : UIColor.grayColor,
        GADTNativeTemplateStyleKeySecondaryBackgroundColor : UIColor.whiteColor,
        GADTNativeTemplateStyleKeyPrimaryFont : [UIFont systemFontOfSize:15.0],
        GADTNativeTemplateStyleKeyPrimaryFontColor : UIColor.blackColor,
        GADTNativeTemplateStyleKeyPrimaryBackgroundColor : UIColor.whiteColor,
        GADTNativeTemplateStyleKeyTertiaryFont : [UIFont systemFontOfSize:15.0],
        GADTNativeTemplateStyleKeyTertiaryFontColor : UIColor.grayColor,
        GADTNativeTemplateStyleKeyTertiaryBackgroundColor : UIColor.whiteColor,
        GADTNativeTemplateStyleKeyMainBackgroundColor : UIColor.whiteColor,
        GADTNativeTemplateStyleKeyCornerRadius : [NSNumber numberWithFloat:7.0],
        
        
    };
    
    templateView.styles = styles;

    // STEP 6: Set the ad for your template to render.
    templateView.nativeAd = nativeAd;
    
    [templateView addHorizontalConstraintsToSuperviewWidth];
    [templateView addVerticalCenterConstraintToSuperview];
   // A native ad has loaded, and can be displayed.
}
- (void)adLoader:(GADAdLoader *)adLoader didFailToReceiveAdWithError:(NSError *)error {
  NSLog(@"%@ failed with error: %@", adLoader, error);
  
}
- (void)adLoaderDidFinishLoading:(GADAdLoader *) adLoader {
    NSLog(@"ad123");
  // The adLoader has finished loading ads, and a new request can be sent.
}

@end
