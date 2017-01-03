//
//  AFFactory.h
//  Factory
//
//  Created by zhou on 2016/12/30.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFOperation.h"
@interface AFFactory : NSObject
typedef NS_ENUM(NSInteger, AFFactoryProductType){
    AFFactoryProductTypeMantou,
    AFFactoryProductTypeYoutiao,
};
+ (instancetype)factoryWithType:(AFFactoryProductType)type;
- (AFOperation *)createProduct;
@end
