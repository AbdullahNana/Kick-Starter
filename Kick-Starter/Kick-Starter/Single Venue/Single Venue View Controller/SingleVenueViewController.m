//
//  SingleVenueViewController.m
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/18.
//

#import "SingleVenueViewController.h"
#import "SingleVenueViewModel.h"
#import "Kick-Starter-Swift.h"

@interface SingleVenueViewController () {
    SingleVenueViewModel *_viewModel;
    
    IBOutlet UILabel *venueNameLabel;
    IBOutlet UIImageView *venueImageView;
    IBOutlet UILabel *venueCapacityLabel;
    IBOutlet UILabel *venueCityLabel;
    IBOutlet UIStackView *imageStackView;
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

-(void)cellStyling {
    venueImageView.clipsToBounds = YES;
    venueImageView.layer.cornerRadius = 20;
    [venueImageView.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [venueImageView.layer setBorderWidth: 4.0];
    
    imageStackView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageStackView.layer.shadowOffset = CGSizeMake(5, 5);
    imageStackView.layer.shadowOpacity = 0.98;
    imageStackView.layer.shadowRadius = 10.0;
}

- (void)setupView {
    [self cellStyling];
    [venueImageView loadImageWithUrlString: _viewModel.venueImage];
    venueNameLabel.text = _viewModel.venueName;
    venueCityLabel.text = _viewModel.venueCity;
    venueCapacityLabel.text = _viewModel.venueCapacity;
    self.title = @"Stadium";
}
@end
