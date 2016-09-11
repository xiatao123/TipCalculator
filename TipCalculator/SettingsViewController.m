//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Tao Xia on 9/11/16.
//  Copyright © 2016 codepath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *TipSelector;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger intValue = [defaults integerForKey:@"default_tip"];
    self.TipSelector.selectedSegmentIndex = intValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self saveDefault];
}

- (void) saveDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.TipSelector.selectedSegmentIndex forKey:@"default_tip"];
    [defaults synchronize];
}

- (void) viewDidDisappear:(BOOL)animated {
    [self saveDefault];
}

@end
