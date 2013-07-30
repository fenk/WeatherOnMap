//
//  AppDelegate.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 10/25/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "AppDelegate.h"
#import "LiveBoxViewController.h"
#import "CHCSVParser.h"
#import "CDCityData+Extension.h"

@implementation AppDelegate
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//    self.tabBarController = [[[BasicTabBarController alloc] init] autorelease];
    LiveBoxViewController *liveBoxViewController = [[LiveBoxViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:liveBoxViewController];
    liveBoxViewController.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc]initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:liveBoxViewController action:@selector(showSettings:)]autorelease];
    
    self.window.rootViewController = navigationController;
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
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


#pragma mark Core Data

- (NSManagedObjectContext *) managedObjectContext {
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"weathermodel.sqlite"]];
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                  initWithManagedObjectModel:[self managedObjectModel]];
    if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:nil URL:storeUrl options:nil error:&error]) {
        /*Error for store creation should be handled in here*/
    }
    
    return persistentStoreCoordinator;
}

- (void) readCSV{
    NSString *file = [[NSBundle bundleForClass:[self class]] pathForResource:@"GeoLiteCity-Location" ofType:@"csv"];
	NSArray *readFromFile = [NSArray arrayWithContentsOfCSVFile:file];
    
    for (NSArray *array in readFromFile) {
        NSArray *objects = [CDCityData fetchObjectsOfClass:[CDCityData class] sortedBy:nil filterString:[NSString stringWithFormat:@"name == '%@'",[array objectAtIndex:2]]];
        if (objects.count == 0 && array.count > 7) {
            CDCityData *cityData = [CDCityData createObjectWithDictionary:array];
            NSLog(@"%@", cityData);
        }
    }
    
    [self saveContext];

}

- (void) saveContext {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

static AppDelegate *sharedDelegate = nil;

+ (AppDelegate *)sharedDelegate {
    if (!sharedDelegate) {
        sharedDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return sharedDelegate;
}

@end
