//
//  ARGSnackViewController.m
//  Argo Nom
//
//  Created by Kevin Nguy on 3/25/15.
//  Copyright (c) 2015 Kevin Nguy. All rights reserved.
//

#import "ARGSnackViewController.h"

@interface ARGSnackViewController ()

@end

#define degreesToRadians(x) (M_PI * (x) / 180.0)
#define kAnimationRotateDeg 5.0

@implementation ARGSnackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.snackLabel.text = self.snack.name;
    self.snackImageView.image = [UIImage imageNamed:self.snack.name];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1];
    
    // Randomize sticker
//    self.stickerImageView.image = [UIImage imageNamed:@""];
    
    // Set amount
    if (self.snack.amount <= 0) {
        self.amountLabel.text = @"None\nleft";
        self.yesButton.enabled = NO;
    }
    else {
        self.amountLabel.text = [NSString stringWithFormat:@"%ld\nleft", self.snack.amount];
    };
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Animate snack image view
    NSInteger randomInt = arc4random_uniform(500);
    float r = (randomInt/500.0)+0.5;
    
    CGAffineTransform leftWobble = CGAffineTransformMakeRotation(degreesToRadians( (kAnimationRotateDeg * -1.0) - r ));
    CGAffineTransform rightWobble = CGAffineTransformMakeRotation(degreesToRadians( kAnimationRotateDeg + r ));
    
    self.snackImageView.transform = leftWobble;  // starting point
    
    [self.snackImageView.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [UIView setAnimationRepeatCount:NSNotFound];
                         self.snackImageView.transform = rightWobble; }
                     completion:nil];
}

- (IBAction)yesButtonPressed:(id)sender
{
    self.thumbImageView.alpha = 0;
    self.thumbImageView.hidden = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.thumbImageView.alpha = 1;
    } completion:^(BOOL finished) {
        [self.delegate didSelectSnack:self.snack];
        [self performSelector:@selector(noButtonPressed:) withObject:nil afterDelay:0.5f];
    }];
}

- (IBAction)noButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
