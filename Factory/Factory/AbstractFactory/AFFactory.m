//
//  AFFactory.m
//  Factory
//
//  Created by zhou on 2016/12/30.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import "AFFactory.h"
#import "AFFactoryMantou.h"
#import "AFFactoryYoutiao.h"
@implementation AFFactory
+ (instancetype)factoryWithType:(AFFactoryProductType)type
{
    AFFactory *factory;
    switch (type) {
        case AFFactoryProductTypeMantou:
            factory = [[AFFactoryMantou alloc] init];
            break;
        case AFFactoryProductTypeYoutiao:
            factory = [[AFFactoryYoutiao alloc] init];
            break;
        default:
            break;
    }
    return factory;
}
- (AFOperation *)createProduct
{
    return nil;
}
@end
