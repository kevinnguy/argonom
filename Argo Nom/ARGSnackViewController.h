//
//  ARGSnackViewController.h
//  Argo Nom
//
//  Created by Kevin Nguy on 3/25/15.
//  Copyright (c) 2015 Kevin Nguy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ARGSnack.h"

@protocol ARGSnackViewControllerDelegate <NSObject>

- (void)didSelectSnack:(ARGSnack *)snack;

@end

@interface ARGSnackViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *snackImageView;
@property (weak, nonatomic) IBOutlet UIImageView *stickerImageView;
@property (weak, nonatomic) IBOutlet UILabel *snackLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;

@property (nonatomic, strong) ARGSnack *snack;
@property (nonatomic, assign) id<ARGSnackViewControllerDelegate> delegate;

@end
