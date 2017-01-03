//
//  SFOperationYoutiao.m
//  Factory
//
//  Created by zhou on 2017/1/3.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "SFOperationYoutiao.h"

@implementation SFOperationYoutiao
@synthesize product = _product;
- (void)productBreakfast{
    NSLog(@"生产油条");
    _product = @"油条";
}
@end
