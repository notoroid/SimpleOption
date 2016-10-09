//
//  ViewController.m
//  IDPOptionsViewController
//
//  Created by 能登 要 on 2016/10/09.
//  Copyright © 2016年 Kaname Noto. All rights reserved.
//

#import "ViewController.h"
#import "SimpleOption.h"

@interface ViewController () <IDPOptionsViewControllerDelegate>
{
    NSNumber *_currentvalue;
    __weak IBOutlet UILabel *_labelDescription;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currentvalue = @1;
    
    [self updateValue];
}

- (void) updateValue
{
    _labelDescription.text = [NSString stringWithFormat:@"CurrentValue:%@",_currentvalue != nil ? _currentvalue : @"0"];
}

- (IBAction)onChangeValue:(id)sender
{
    IDPOptionsViewController *optionsViewController = [IDPOptionsViewController optionViewController];;
    optionsViewController.delegate = self;
    optionsViewController.key = @"Foo";
    optionsViewController.currentValue = _currentvalue;
    
    static NSArray *s_items = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_items = @[
                     @{@"key":@"Value1",@"value":@1}
                    ,@{@"key":@"Value2",@"value":@2}
                    ,@{@"key":@"Value3",@"value":@3}
                    ,@{@"key":@"Value4",@"value":@4}
                    ,@{@"key":@"Value5",@"value":@5}
                    ,@{@"key":@"Value6",@"value":@6}
                    ,@{@"key":@"Value7",@"value":@7}
                    ,@{@"key":@"Value8",@"value":@8}
                    ,@{@"key":@"Value9",@"value":@9}
                    ,@{@"key":@"Value10",@"value":@10}
                    ,@{@"key":@"Value11",@"value":@11}
                    ,@{@"key":@"Value12",@"value":@12}
                    ];
    });
    
    optionsViewController.items = s_items;
    
    [self presentViewController:optionsViewController animated:YES completion:^{
       
    }];
    
}

- (void) optionsViewControllerDidChange:(IDPOptionsViewController *)optionsViewController key:(NSString *)key value:(id)value
{
    _currentvalue = value;
    [self updateValue];
}

@end
