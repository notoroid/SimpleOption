//
//  IDPOptionsViewController.m
//  IDPOptionsViewController
//
//  Created by 能登 要 on 2015/10/22.
//  Copyright © 2015年 Irimasu Densan Planning. All rights reserved.
//

#import "IDPOptionsViewController.h"

@interface IDPOptionsViewController () <UIPickerViewDataSource,UIPickerViewDelegate>
{
    __weak IBOutlet UIPickerView *_pickerView;
    
}
@end

@implementation IDPOptionsViewController

+ (IDPOptionsViewController *)optionViewController
{
    IDPOptionsViewController *optionsViewController = [[UIStoryboard storyboardWithName:@"IDPOptionsViewController" bundle:nil] instantiateInitialViewController];
    optionsViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    optionsViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    return optionsViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [_pickerView reloadAllComponents];
    
    if( _currentValue != nil ){
        [_items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *dict = obj;
            
            if( [dict[@"value"] isEqual:_currentValue] ){
                [_pickerView selectRow:idx inComponent:0 animated:NO];
                *stop = YES;
            }
        }];
    }else{
        NSDictionary *dict = _items.count > 0 ? _items[0] : nil;
        if( dict != nil ){
            [_delegate optionsViewControllerDidChange:self key:dict[@"key"] value:dict[@"value"]];
        }
    }
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDone:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:NO completion:^{
       
    }];
}

- (IBAction)onCancel:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:NO completion:^{
        
    }];
}

- (UIModalPresentationStyle)modalPresentationStyle
{
    return UIModalPresentationOverCurrentContext;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _items.count;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _items[row][@"key"];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_delegate optionsViewControllerDidChange:self key:_items[row][@"key"] value:_items[row][@"value"]];
}

@end
