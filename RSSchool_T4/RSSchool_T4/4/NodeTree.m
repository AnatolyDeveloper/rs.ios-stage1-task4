//
//  NodeTree.m
//  RSSchool_T4
//
//  Created by Anatol Uarmolovich on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "NodeTree.h"

@implementation NodeTree
-(instancetype)initWithValue:(NSUInteger)value {
    self = [super init];
    if (self) {
        _value = [NSNumber numberWithUnsignedInteger:value];
        _leftChild = nil;
        _rightChild = nil;
    }
    return self;
}


@end
