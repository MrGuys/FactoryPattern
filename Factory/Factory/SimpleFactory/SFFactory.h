//
//  SFFactory.h
//  Factory
//
//  Created by zhou on 2016/12/30.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFOperation.h"
typedef NS_ENUM(NSInteger, SFFactoryProductType){
    SFFactoryProductTypeMantou,
    SFFactoryProductTypeYoutiao,
};
@interface SFFactory : NSObject
//工厂（Factory）角色：接受客户端的请求，通过请求负责创建相应的产品对象。
+ (SFOperation *)operationBreakfast:(SFFactoryProductType )breakfastType;

@end
