//
//  ARGSnackViewController.h
//  Argo Nom
//
//  Created by Kevin Nguy on 3/25/15.
//  Copyright (c) 2015 Kevin Nguy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ARGSnack.h"

@interface ARGSnackViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *snackImageView;
@property (weak, nonatomic) IBOutlet UIImageView *stickerImageView;
@property (weak, nonatomic) IBOutlet UILabel *snackLabel;

@property (nonatomic, strong) ARGSnack *snack;

@end
