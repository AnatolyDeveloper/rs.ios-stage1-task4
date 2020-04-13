//
//  NodeTree.h
//  RSSchool_T4
//
//  Created by Anatol Uarmolovich on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NodeTree : NSObject

@property (nonatomic, retain, readwrite) NSNumber *value;
@property (nonatomic, retain, readwrite) NodeTree *leftChild;
@property (nonatomic, retain, readwrite) NodeTree *rightChild;

-(instancetype)initWithValue:(NSUInteger)value;

@end

NS_ASSUME_NONNULL_END
