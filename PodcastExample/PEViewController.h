//
//  PEViewController.h
//  PodcastExample
//
//  Created by Aleksandr Fesenko on 12/1/13.
//  Copyright (c) 2013 Aleksandr Fesenko. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PEViewController : UIViewController <UITableViewDataSource>
{
    NSArray *_data;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
