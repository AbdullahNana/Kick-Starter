//
//  SingleVenueViewModel.h
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/18.
//

#import <Foundation/Foundation.h>
#import "Kick_Starter-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface SingleVenueViewModel : NSObject
- (void)set:(Venue *) selectedVenue;
- (NSString *) venueName;
- (NSString *) venueCapacity;
- (NSString *) venueCity;
- (NSString *) venueImage;

@end

NS_ASSUME_NONNULL_END
