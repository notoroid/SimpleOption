//
//  AppDelegate.h
//  IDPOptionsViewController
//
//  Created by 能登 要 on 2016/10/09.
//  Copyright © 2016年 Kaname Noto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

