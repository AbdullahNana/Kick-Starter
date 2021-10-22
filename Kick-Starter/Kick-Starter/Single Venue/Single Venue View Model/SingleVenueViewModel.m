//
//  SingleVenueViewModel.m
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/18.
//

#import "SingleVenueViewModel.h"

@implementation SingleVenueViewModel {
    Venue * _singleVenue;
}

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)set:(Venue *) selectedVenue {
    _singleVenue = selectedVenue;
}
- (NSString *) venueName {
    return _singleVenue.name;
}
- (NSString *) venueCapacity {
    NSString* capacity = [NSString stringWithFormat:@"Venue Capacity: %li", (long) _singleVenue.cap];
    return capacity;
}

- (NSString *) venueCity {
    
    return [@"City: " stringByAppendingString: _singleVenue.city];
}
- (NSString *) venueImage {
    return _singleVenue.image;
}

@end
