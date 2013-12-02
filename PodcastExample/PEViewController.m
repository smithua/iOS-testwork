//
//  PEViewController.m
//  PodcastExample
//
//  Created by Aleksandr Fesenko on 12/1/13.
//  Copyright (c) 2013 Aleksandr Fesenko. All rights reserved.
//

#import "PEViewController.h"
#import "PEImageCell.h"
#import "PEDetailViewController.h"
#import "RSSParser.h"
#import "UIImageView+WebCache.h"

@interface PEViewController ()

@end

@implementation PEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://feeds.rucast.net/Umputun"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [RSSParser parseRSSFeedForRequest:request success:^(NSArray *feedItems) {
        _data = feedItems;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [_data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const ImageCellId = @"ImageCell";
    
    PEImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageCellId];
    if (cell == nil) {
        cell = [[PEImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ImageCellId];
    }
    
    // Configure the cell...
    [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://podcast.umputun.com/images/umputun-art-big.jpg"]];
     // placeholderImage:[UIImage imageNamed:@"logo.png"]];
    
    RSSItem *item = [_data objectAtIndex:indexPath.row];
    cell.cellTextLabel.text = item.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
