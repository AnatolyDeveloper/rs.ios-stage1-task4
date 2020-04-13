//
//  MuttableArray.h
//  RSSchool_T4
//
//  Created by Anatol Uarmolovich on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (AdditionalQueue)
- (id) deque;
- (void) enqueue:(id)obj;
- (bool) isEmpty;
@end

NS_ASSUME_NONNULL_END
