//
//  PEImageCell.h
//  PodcastExample
//
//  Created by Aleksandr Fesenko on 12/1/13.
//  Copyright (c) 2013 Aleksandr Fesenko. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PEImageCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;
@property (strong, nonatomic) IBOutlet UILabel *cellTextLabel;

@end
