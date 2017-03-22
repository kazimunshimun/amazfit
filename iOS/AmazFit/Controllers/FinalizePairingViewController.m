//
//  FinalizePairingViewController.m
//  AmazFit
//
//  Created by Anik on 3/20/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "FinalizePairingViewController.h"
#import "MMMaterialDesignSpinner.h"

@interface FinalizePairingViewController ()
@property (weak, nonatomic) IBOutlet MMMaterialDesignSpinner *searchSpinner;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *pairingInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *closePairingButton;
@property (weak, nonatomic) IBOutlet UIButton *createProfileButton;
@property (weak, nonatomic) IBOutlet UIImageView *pairingCompleteImageView;

@end

@implementation FinalizePairingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.searchSpinner startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:10.0
                                     target:self
                                   selector:@selector(startDoubleTappingInstraction)
                                   userInfo:nil
                                    repeats:NO];
}

-(void) startDoubleTappingInstraction{
    [self.searchSpinner stopAnimating];
    
    NSString *doubleTapInstructionTitle = @"Firmly double tap the Amazfit to confirm";
    self.titleLabel.text = doubleTapInstructionTitle;
    self.pairingInfoLabel.hidden = NO;
    
    [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(pairingSuccessfulInstraction)
                                   userInfo:nil
                                    repeats:NO];
}

-(void) pairingSuccessfulInstraction{
    
    NSString *pairSuccessfulInstructionTitle = @"Amazfit is paired";
    self.titleLabel.text = pairSuccessfulInstructionTitle;
    self.createProfileButton.hidden = NO;
    self.pairingCompleteImageView.hidden = NO;
    self.closePairingButton.hidden = YES;
    self.pairingInfoLabel.hidden = YES;
    
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
