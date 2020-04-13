#import "FullBinaryTrees.h"
#import "MuttableArray.h"
#import "NodeTree.h"


@interface FullBinaryTrees()

@property (nonatomic, retain) NSMutableDictionary <NSNumber*, NSMutableArray<NodeTree*> *> *trees;

@end

@implementation FullBinaryTrees

- (NSMutableArray<NodeTree*>*)treesWithNodes:(NSUInteger)amount {
    NSMutableArray *binaryTrees = [self.trees objectForKey:[NSNumber numberWithUnsignedInteger:amount]];
    if (binaryTrees != nil) {
        return binaryTrees;
    }
    if (amount % 2 == 0) {
        return nil;
    }
    if (amount == 1) {
        NodeTree *node = [[NodeTree alloc] initWithValue:0];
        NSMutableArray *nodes = [NSMutableArray new];
        [nodes addObject:node];
        return nodes;
    }
    NSMutableArray *result = [NSMutableArray new];
    for (NSUInteger i = 1; i <= amount - 2; i += 2) {
        NSMutableArray *leftTrees = [self treesWithNodes:i];
        NSMutableArray *rightTrees = [self treesWithNodes:(amount - i - 1)];
        for (NSUInteger j = 0; j < [leftTrees count]; j++) {
            for (NSUInteger k = 0; k < [rightTrees count]; k++) {
                NodeTree *vertex = [[NodeTree alloc] initWithValue:0];
                [vertex setLeftChild:[leftTrees objectAtIndex:j]];
                [vertex setRightChild:[rightTrees objectAtIndex:k]];
                [result addObject:vertex];
            }
        }
    }
    [self.trees setObject:result forKey:[NSNumber numberWithUnsignedInteger:amount]];
    return result;
}

- (NSString*)transformTreeToStringView:(NSMutableArray<NodeTree*>*)trees {
    NSMutableArray *stringTrees = [NSMutableArray new];
    for (NSUInteger j = 0; j < [trees count]; j++) {
        NSMutableArray *queue = [NSMutableArray new];
        NodeTree *root = [trees objectAtIndex:j];
        [queue enqueue:root];
        NSMutableArray *stringTree = [NSMutableArray new];
        while (![queue isEmpty]) {
            for (NSUInteger i = 0; i < [queue count]; i++) {
                NodeTree *node = [queue deque];
                if (node != nil && [[node value] unsignedIntegerValue] == 0) {
                    [stringTree addObject:@"0"];
                    if ([node leftChild] == nil) {
                        node.leftChild = [[NodeTree alloc] initWithValue:1];
                    }
                    if ([node rightChild] == nil) {
                        node.rightChild = [[NodeTree alloc] initWithValue:1];
                    }
                    [queue enqueue:[node leftChild]];
                    [queue enqueue:[node rightChild]];
                } else {
                    [stringTree addObject:@"null"];
                }
            }
        }
        [queue release];
        [root release];
        for (NSUInteger i = [stringTree count] - 1; i >= 1; i--) {
            if (![[stringTree objectAtIndex:i] isEqualToString:@"null"]) {
                break;
            } else {
                [stringTree removeObjectAtIndex:i];
            }
        }
        NSString *modifiedStringTree = [NSString stringWithFormat:@"[%@]", [stringTree componentsJoinedByString:@", "]];
        [stringTrees addObject:modifiedStringTree];
        [stringTree release];
    }
    NSString *result = [NSString stringWithFormat:@"[%@]", [stringTrees componentsJoinedByString:@", "]];
    [stringTrees release];
    return result;
}

- (NSString*)stringForNodeCount:(NSInteger)count {
    NSMutableArray<NodeTree*>* trees = [self treesWithNodes:count];
    return [self transformTreeToStringView:trees];
}
@end
