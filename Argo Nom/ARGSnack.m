//
//  ARGSnack.m
//  Argo Nom
//
//  Created by Kevin Nguy on 3/25/15.
//  Copyright (c) 2015 Kevin Nguy. All rights reserved.
//

#import "ARGSnack.h"

@implementation ARGSnack

- (instancetype)initWithName:(NSString *)name amount:(NSInteger)amount
{
    self = [super init];
    if (self){
        self.name = name;
        self.amount = amount;
    }
    
    return self;
}

@end
