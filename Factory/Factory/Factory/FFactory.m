//
//  FFactory.m
//  Factory
//
//  Created by zhou on 2016/12/30.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import "FFactory.h"
@implementation FFactory
+ (FFOperation *)createOperation{
    FFOperation *operation = [[FFOperation alloc] init];
    return operation;
}

@end
