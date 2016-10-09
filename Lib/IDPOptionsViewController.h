//
//  IDPOptionsViewController.h
//  IDPOptionsViewController
//
//  Created by 能登 要 on 2015/10/22.
//  Copyright © 2015年 Irimasu Densan Planning. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IDPOptionsViewControllerDelegate;

@interface IDPOptionsViewController : UIViewController

+ (IDPOptionsViewController *)optionViewController;

@property(strong,nonatomic) NSString *key;
@property(strong,nonatomic) id currentValue;
@property(strong,nonatomic) NSArray *items;
@property(weak,nonatomic) id<IDPOptionsViewControllerDelegate> delegate;
@end


@protocol IDPOptionsViewControllerDelegate <NSObject>

- (void) optionsViewControllerDidChange:(IDPOptionsViewController *)optionsViewController key:(NSString *)key value:(id)value;

@end
