//
//  PEAppDelegate.m
//  PodcastExample
//
//  Created by Aleksandr Fesenko on 12/1/13.
//  Copyright (c) 2013 Aleksandr Fesenko. All rights reserved.
//

#import "PEAppDelegate.h"
#import "FMDatabase.h"

@implementation PEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *databaseTargetPath = [path stringByAppendingPathComponent:@"podcast.sqlite"];
    
    NSString *databaseFromResource = [[NSBundle mainBundle] pathForResource:@"podcast" ofType:@"sqlite"];
    
    NSString *resources = [[NSBundle mainBundle] pathForResource:@"podcast" ofType:@"sqlite"];
    
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:databaseTargetPath];
    
    if (!fileExist)
    {
        [[NSFileManager defaultManager] copyItemAtPath:databaseFromResource toPath:databaseTargetPath error:nil];
    }
     
    FMDatabase *db = [FMDatabase databaseWithPath:databaseTargetPath];
    
    if (![db open]) {
        return YES;
    }
    
    [db executeUpdate:@"INSERT INTO podcast VALUES(:url, :name, :artwork_url)" withParameterDictionary:@{@"url:"@"hfadf://url"@"name":@"coolName",@"artwork_url":@"lol",@"id":@1}];

    NSLog(@"%@", [db lastErrorMessage]);
    //FMResultSet *s = [db exe]
    
    
    
    [db close];
     
    
    
    UIImage *navBackgroundImage = [UIImage imageNamed:@"nav_pattern.png"];
    [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
    [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
    [UIFont fontWithName:@"HelveticaNeue" size:17.0], NSFontAttributeName, nil]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
