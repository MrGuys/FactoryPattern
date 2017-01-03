//
//  SFFactory.m
//  Factory
//
//  Created by zhou on 2016/12/30.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import "SFFactory.h"
#import "SFOperationMantou.h"
#import "SFOperationYoutiao.h"
@implementation SFFactory
+ (SFOperation *)operationBreakfast:(SFFactoryProductType)breakfastType
{
    SFOperation *operation;
    switch (breakfastType) {
        case SFFactoryProductTypeMantou:
            operation = [[SFOperationMantou alloc] init];
            break;
        case SFFactoryProductTypeYoutiao:
            operation = [[SFOperationYoutiao alloc] init];
            break;
        default:
            return nil;
            break;
    }
    return operation;
}

@end
