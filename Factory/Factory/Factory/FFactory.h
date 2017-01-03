//
//  FFactory.h
//  Factory
//
//  Created by zhou on 2016/12/30.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFOperation.h"
@interface FFactory : NSObject
+ (FFOperation *)createOperation;
@end
