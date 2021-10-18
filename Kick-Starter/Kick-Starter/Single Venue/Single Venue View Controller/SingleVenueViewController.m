//
//  SingleVenueViewController.m
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/18.
//

#import "SingleVenueViewController.h"
#import "SingleVenueViewModel.h"

@interface SingleVenueViewController () {
    SingleVenueViewModel *_viewModel;
    IBOutlet UIImageView *venueImageView;
    IBOutlet UILabel *venueNameLabel;
    IBOutlet UILabel *venueCityLabel;
    IBOutlet UILabel *venueCapacityLabel;
}
@end

@implementation SingleVenueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)set:(Venue *) selectedVenue {
    [self setupViewModel];
    [_viewModel set:selectedVenue];
}

- (void)setupViewModel {
    if (!_viewModel) {
        _viewModel = [[SingleVenueViewModel alloc] init];
    }
}

- (void)setupView {
    [venueImageView loadImageWithUrlString: _viewModel.venueImage];
    venueNameLabel.text = _viewModel.venueName;
    venueCityLabel.text = _viewModel.venueCity; 
}
@end
