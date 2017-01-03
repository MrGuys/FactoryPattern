//
//  AFFactoryYoutiao.m
//  Factory
//
//  Created by zhou on 2017/1/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AFFactoryYoutiao.h"
#import "AFOperationYoutiao.h"
@implementation AFFactoryYoutiao
- (AFOperation *)createProduct
{
    return [[AFOperationYoutiao alloc] init];
}
@end
