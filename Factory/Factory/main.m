//
//  main.m
//  Factory
//
//  Created by zhou on 2016/12/30.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFFactory.h"
#import "FFactoryMantou.h"
#import "AFFactory.h"
// http://www.jb51.net/article/81497.htm
// http://blog.csdn.net/casablaneca/article/details/39851457#objc
// http://www.cnblogs.com/eagle927183/p/3479644.html
// http://blog.csdn.net/developer_zhang/article/details/19619927?utm_source=tuicool&utm_medium=referral
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
        简单工厂模式的优缺点：
        1.）工厂类含有必要的创建何种产品的逻辑，这样客户端只需要请求需要的产品，而不需要理会产品的实现细节。
        2.）工厂类只有一个，它集中了所有产品创建的逻辑，它将是整个系统的瓶颈，同时造成系统难以拓展。
        3.）简单工厂模式通常使用静态工厂方法，这使得工厂类无法由子类继承，这使得工厂角色无法形成基于继承的等级结构。
         **/
        SFOperation *sfOperation = [SFFactory operationBreakfast:SFFactoryProductTypeMantou];
        [sfOperation productBreakfast];
        NSLog(@"生产产品:%@",sfOperation.product);
        
        
        /**
         工厂方法的优缺点：
         1.）降低了工厂类的内聚，满足了类之间的层次关系，又很好的符合了面向对象设计中的单一职责原则，这样有利于程序的拓展
         **/
        FFOperation *ffOperation = [FFactoryMantou createOperation];
        [ffOperation productBreakfast];
        NSLog(@"生产产品:%@",ffOperation.product);
        
        
        /**
          抽象工厂模式的优点
         （1）分离接口和实现
         客户端使用抽象工厂来创建需要的对象，而客户端根本就不知道具体的实现是谁，客户端只是面向产品的接口编程而已。也就是说，客户端从具体的产品实现中解耦。
         （2）使切换产品族变得容易
         因为一个具体的工厂实现代表的是一个产品族，比如上面例子的从Intel系列到AMD系列只需要切换一下具体工厂。
         2.5 抽象工厂模式的缺点
         不太容易扩展新的产品：如果需要给整个产品族添加一个新的产品，那么就需要修改抽象工厂，这样就会导致修改所有的工厂实现类。
         **/
        
        AFFactory *afFactory = [AFFactory factoryWithType:AFFactoryProductTypeMantou];
        AFOperation *afOperation = [afFactory createProduct];
        [afOperation productBreakfast];
        NSLog(@"生产产品;%@",afOperation.product);
   
    }
    return 0;
}
