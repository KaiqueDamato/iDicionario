//
//  MackenzieAppDelegate.m
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieAppDelegate.h"
#import "LetraAViewController.h"
#import "ListaTableViewController.h"
#import "BuscaViewController.h"

@implementation MackenzieAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.tabBarController = [[UITabBarController alloc] init];
    
    LetraAViewController *viewController = [[LetraAViewController alloc] initWithNibName:nil bundle:nil];
    
    BuscaViewController *viewController2 = [[BuscaViewController alloc] initWithNibName:nil bundle:nil];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.buscaNavigationController = [[UINavigationController alloc] initWithRootViewController:viewController2];
    
    ListaTableViewController *table = [[ListaTableViewController alloc] init];
    
    NSArray *views = [NSArray arrayWithObjects:self.navigationController, table, self.buscaNavigationController,nil];
    
    self.tabBarController.viewControllers = views;
    
    UIImage *tab1 = [UIImage imageNamed:@"dicionario"];
    [self.navigationController.tabBarItem setImage:tab1];
    self.navigationController.tabBarItem.title = @"Dicionário";
    
    UIImage *tab2 = [UIImage imageNamed:@"lista"];
    [table.tabBarItem setImage:tab2];
    table.title = @"Lista";
    
    UIImage *tab3 = [UIImage imageNamed:@"busca"];
    [self.buscaNavigationController.tabBarItem setImage:tab3];
    self.buscaNavigationController.title = @"Busca";
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
