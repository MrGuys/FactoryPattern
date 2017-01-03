//
//  AFFactoryMantou.m
//  Factory
//
//  Created by zhou on 2017/1/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AFFactoryMantou.h"
#import "AFOperationMantou.h"
@implementation AFFactoryMantou
- (AFOperation *)createProduct
{
    return [[AFOperationMantou alloc] init];
}
@end
