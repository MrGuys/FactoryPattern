//
//  FFactoryMantou.m
//  Factory
//
//  Created by zhou on 2017/1/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "FFactoryMantou.h"
#import "FFOperationMantou.h"
@implementation FFactoryMantou
+ (FFOperation *)createOperation
{
    return [[FFOperationMantou alloc] init];
}
@end
