//
//  FFactoryYoutiao.m
//  Factory
//
//  Created by zhou on 2017/1/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "FFactoryYoutiao.h"
#import "FFOperationYoutiao.h"
@implementation FFactoryYoutiao
+ (FFOperation *)createOperation{
    return [[FFOperationYoutiao alloc] init];
}
@end
