//
//  LinearProgressView.m
//  AmazFit
//
//  Created by Anik on 3/23/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "LinearProgressView.h"

@interface LinearProgressView()

@property IBInspectable UIColor *barColor;
@property IBInspectable UIColor *trackColor;
@property IBInspectable CGFloat barThickness;
@property IBInspectable CGFloat barPadding;
@property IBInspectable CGFloat trackPadding;
@property IBInspectable CGFloat progressValue;

@end

@implementation LinearProgressView{
    CGFloat trackHeight;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawProgressView];
}

-(CGFloat) getTrackHeight{
    return _barThickness + _trackPadding;
}

-(CGFloat) getTrackOffset{
    return [self getTrackHeight]/2;
}

-(CGFloat) calculatePercentage{
    CGFloat screenWidth = self.frame.size.width - (_barPadding * 2) - ([self getTrackOffset] * 2);
    CGFloat progress = ((_progressValue/100) * screenWidth);
    return progress < 0 ? _barPadding : progress;
}

-(void) drawProgressView{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //progress bar track
    //CGContextSetStrokeColor(context, [[UIColor lightGrayColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, [self getTrackHeight]);
    CGContextMoveToPoint(context, _barPadding + [self getTrackOffset], self.frame.size.height / 2);
    CGContextAddLineToPoint(context, self.frame.size.width - _barPadding - [self getTrackOffset], self.frame.size.height/2);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
    
    CGFloat red[4] = {1.0f, 1.0f, 0.0f, 0.0f};
    //progress bar
    CGContextSetStrokeColor(context, red);
    CGContextSetLineWidth(context, _barThickness);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, _barPadding + [self getTrackOffset], self.frame.size.height / 2);
    CGContextAddLineToPoint(context, _barPadding + [self getTrackOffset] + [self calculatePercentage], self.frame.size.height/2);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
    /*
    CGContextSetRGBFillColor(context, finishedStepColorComponents[0], finishedStepColorComponents[1], finishedStepColorComponents[2], finishedStepColorAlpha);
    CGContextMoveToPoint(context, i * (stepWidth + 1), 0);
    CGContextAddLineToPoint(context, i * (stepWidth + 1), CGRectGetHeight(self.frame));
    CGContextAddLineToPoint(context, (i + 1) * stepWidth + i * 1, CGRectGetHeight(self.frame));
    CGContextAddLineToPoint(context, (i + 1) * stepWidth + i * 1, 0);
    CGContextAddLineToPoint(context, i * (stepWidth + 1), 0);
    CGContextFillPath(context);
    */
    
    // Progres Bar Track
    //context?.setStrokeColor(trackColor.cgColor)
    
    /*
    // Progress Bar
    let barColor = barColorForValue != nil ? barColorForValue!(Float(progressValue)):self.barColor
    context?.move(to: CGPoint(x: barPadding + trackOffset, y: frame.size.height / 2))
    context?.addLine(to: CGPoint(x: barPadding + trackOffset + calcualtePercentage(), y: frame.size.height / 2))
    context?.setLineCap(CGLineCap.round)
    context?.strokePath()
     */
}


@end
