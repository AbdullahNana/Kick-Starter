//
//  SingleVenueViewController.h
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/18.
//

#import <UIKit/UIKit.h>
@class Venue;

NS_ASSUME_NONNULL_BEGIN

@interface SingleVenueViewController : UIViewController
- (void)set:(Venue *) selectedVenue; 

@end

NS_ASSUME_NONNULL_END
