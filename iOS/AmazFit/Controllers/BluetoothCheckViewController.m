//
//  BluetoothCheckViewController.m
//  AmazFit
//
//  Created by Anik on 3/20/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "BluetoothCheckViewController.h"
#import "PairDeviceViewController.h"

@interface BluetoothCheckViewController ()

@end

@implementation BluetoothCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(startDeviceSearching)
                                   userInfo:nil
                                    repeats:NO];
}

-(void) startDeviceSearching{
    
    NSString * storyboardName = @"SetupOnboard";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    PairDeviceViewController *pairDeviceVC = [storyboard instantiateViewControllerWithIdentifier:@"pairDeviceVC"];
    [self.navigationController pushViewController:pairDeviceVC animated:YES];
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

@end
