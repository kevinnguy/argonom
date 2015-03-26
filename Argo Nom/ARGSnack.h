//
//  ARGSnack.h
//  Argo Nom
//
//  Created by Kevin Nguy on 3/25/15.
//  Copyright (c) 2015 Kevin Nguy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARGSnack : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger amount;

- (instancetype)initWithName:(NSString *)name amount:(NSInteger)amount NS_DESIGNATED_INITIALIZER;

@end
