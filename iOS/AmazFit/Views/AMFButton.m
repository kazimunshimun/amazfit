//
//  AMFButton.m
//  AmazFit
//
//  Created by Anik on 2/28/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "AMFButton.h"

@interface AMFButton ()
//@property (nonatomic, strong) IBInspectable UIImage *leftImage;
@end

@implementation AMFButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefault];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupDefault];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGRect availableSpace = UIEdgeInsetsInsetRect(self.bounds, self.contentEdgeInsets);
    CGFloat availableWidth = availableSpace.size.width - self.imageEdgeInsets.right - self.imageView.frame.size.width - self.titleLabel.frame.size.width;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, availableWidth/2, 0, 0);

}

- (void)setupDefault
{
    self.layer.cornerRadius = self.frame.size.height/2.0;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    
 //   self.tintColor = UIColor.whiteColor()
}

-(void)setLeftImage:(UIImage *)leftImage{
  //  self.leftImage = leftImage;
    [self updateViews];
}

- (void)updateViews {
   // self.leftImage
  //  [self.imageView setImage:self.leftImage];
}

@end
