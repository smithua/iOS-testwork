//
//  PEDetailViewController.m
//  PodcastExample
//
//  Created by Aleksandr Fesenko on 12/1/13.
//  Copyright (c) 2013 Aleksandr Fesenko. All rights reserved.
//

#import "PEDetailViewController.h"
#import "UIImageView+WebCache.h"

@interface PEDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageCoverView;

@end


@implementation PEDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"bg_pattern.png"];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    self.view.backgroundColor = backgroundColor;
    
    [imageAlbumView setImageWithURL:[NSURL URLWithString:@"http://podcast.umputun.com/images/umputun-art-big.jpg"]
    placeholderImage:[UIImage imageNamed:@"bg_pattern.png"]
                       options:SDWebImageRefreshCached];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
