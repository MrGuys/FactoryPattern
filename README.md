# FactoryPattern

说明：在我理解中，这里所谓的抽象，其实就是制定某一个接口规范。具体体现在代码里，就是设置一个基类，基类遵守某一套接口规范，但是其具体的实现则通过子类化来完成。当然，这里我们也可以使用协议来规范这套接口规范。相对的，具体就是具有对抽象做子类化之后产生的实体。

###1. 简单工厂模式
如何理解简单工厂，工厂方法， 抽象工厂三种设计模式？
 
简单工厂的生活场景，卖早点的小摊贩，他给你提供包子，馒头，地沟油烙的煎饼等，小贩是一个工厂，它生产包子，馒头，地沟油烙的煎饼。该场景对应的UML图如下所示：

![图1](http://upload-images.jianshu.io/upload_images/1598196-d67242036cc6ede1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

######简单工厂模式的参与者：
**工厂（Factory）角色：**接受客户端的请求，通过请求负责创建相应的产品对象。
**抽象产品（Abstract Product）角色:**是工厂模式所创建对象的父类或是共同拥有的接口。可是抽象类或接口。
**具体产品（ConcreteProduct）对象:**工厂模式所创建的对象都是这个角色的实例。
 
######简单工厂模式的演变：
* 当系统中只有唯一的产品时，可以省略抽象产品，如图1所示。这样，工厂角色与具体产品可以合并。
 
######简单工厂模式的优缺点：
* 工厂类含有必要的创建何种产品的逻辑，这样客户端只需要请求需要的产品，而不需要理会产品的实现细节。
* 工厂类只有一个，它集中了所有产品创建的逻辑，它将是整个系统的瓶颈，同时造成系统难以拓展。
* 简单工厂模式通常使用静态工厂方法，这使得工厂类无法由子类继承，这使得工厂角色无法形成基于继承的等级结构。

下面编写了一个卖早餐的例子来说明:

```
SFFactory.h 作为工厂的角色

#import "SFOperation.h"
typedef NS_ENUM(NSInteger, SFFactoryProductType){
    SFFactoryProductTypeMantou,
    SFFactoryProductTypeYoutiao,
};
@interface SFFactory : NSObject
//工厂（Factory）角色：接受客户端的请求，通过请求负责创建相应的产品对象。
+ (SFOperation *)operationBreakfast:(SFFactoryProductType )breakfastType;

@end
```

```
SFFactory.m

#import "SFOperationMantou.h"
#import "SFOperationYoutiao.h"
@implementation SFFactory
+ (SFOperation *)operationBreakfast:(SFFactoryProductType)breakfastType
{
//通过枚举返回不同的产品
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
```
```
SFOperation.h 抽象产品角色，通过子类化它来获得具体的角色

@interface SFOperation : NSObject
@property (nonatomic, copy, readonly)NSString *product;
- (void)productBreakfast; 
@end

```

```
SFOperation.m

@implementation SFOperation
- (void)productBreakfast{    
}
@end
```
```
SFOperationMantou.h  具体产品角色，SFOperation的子类化，实际工厂返回的可能就是它，当然，也可能是油条、豆浆等

@interface SFOperationMantou : SFOperation
- (void)productBreakfast;
@end
```
```
SFOperationMantou.m

@synthesize product = _product;
- (void)productBreakfast{
    _product = @"馒头";
}
```

**最后是main函数的调用**
```
SFOperation *sfOperation = [SFFactory operationBreakfast:SFFactoryProductTypeMantou];
[sfOperation productBreakfast];
NSLog(@"生产产品:%@",sfOperation.product);
```
SFFactory作为一个工厂，里面包含了创建产品的逻辑，这里使用一个枚举来控制是创建油条还是馒头的具体产品。但是这里的问题就是，如果产品类的逻辑非常复杂，那么这个共产类会复杂的不可控。当然，外部调用的话，根本无需关心内部如何创建具体的产品，因为抽象产品类SFOperation已经制定了一套接口规范。

###2. 工厂方法模式
工厂方法使用OOP的多态性，将工厂和产品都抽象出一个基类，在基类中定义统一的接口，然后在具体的工厂中创建具体的产品。工厂方法的生活场景，联合利华要生产“夏士莲”和“清扬”两款洗发水，它会建一个生产“夏士莲”的工厂和一个生产“清扬”的工厂。
![图2](http://upload-images.jianshu.io/upload_images/1598196-574232f7e3f9e535.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

######工厂方法模式中的参与者：
**抽象工厂角色：**与应用程序无关，任何在模式中创建对象的工厂必须实现这个接口。
**具体工厂角色：**实现了抽象工厂接口的具体类，含有与引用密切相关的逻辑，并且受到应用程序的调用以创建产品对象。
**抽象产品角色：**工厂方法所创建产品对象的超类型，也就是产品对象的共同父类或共同拥有的接口。
**具体产品角色：**这个角色实现了抽象产品角色所声名的接口。工厂方法所创建的每个具体产品对象都是某个具体产品角色的实例。
 

工厂方法的优缺点：
* 降低了工厂类的内聚，满足了类之间的层次关系，又很好的符合了面向对象设计中的单一职责原则，这样有利于程序的拓展，如图三所示：


![图3](http://upload-images.jianshu.io/upload_images/1598196-282fbb9d12c6c68a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


总结：把“共性”提取出来，根据各自的“个性”建立各自的继承共性的实现。下面依然使用早餐的例子来说明:

```
FFactory.h  //抽象工厂角色

@interface FFactory : NSObject
+ (FFOperation *)createOperation;
@end
```

```
FFactory.m

@implementation FFactory
+ (FFOperation *)createOperation{
    FFOperation *operation = [[FFOperation alloc] init];
    return operation;
}
@end
```

```
FFOperation.h 抽象产品角色

@interface FFOperation : NSObject
@property (nonatomic, copy, readonly)NSString *product;
- (void)productBreakfast;
@end
```

```
FFOperation.m

@implementation FFOperation
- (void)productBreakfast{
    
}
@end
```

```
FFactoryMantou.h 具体工厂角色

@interface FFactoryMantou : FFactory
@end
```

```
FFactoryMantou.m

#import "FFOperationMantou.h"
@implementation FFactoryMantou
+ (FFOperation *)createOperation{
    return [[FFOperationMantou alloc] init];
}
@end
```

```
FFOperationMantou.h 具体产品角色

@interface FFOperationMantou : FFOperation
- (void)productBreakfast;
@end
```

```
FFOperationMantou.m

@synthesize product = _product;
- (void)productBreakfast{
    _product = @"馒头";
}
```
main里面的调用
```
FFOperation *ffOperation = [FFactoryMantou createOperation];
[ffOperation productBreakfast];
NSLog(@"生产产品:%@",ffOperation.product);
```
与简单工厂模式把所有产品都放到SFFactory来获取相比，工厂模式每次需要一个新的产品，就需要新建一个具体工厂来生成新的产品。当你需要豆浆的时候，只要新建一个继承与FFactory的工厂类，再创建一个继承于FFOperation的具体产品就可以创建新的产品了。对原来的代码都不需要做任何修改。这就使得产品的拓展变得简单。

###3. 抽象工厂设计模式

所谓抽象工厂是指一个工厂等级结构可以创建出分属于不同产品等级结构的一个产品族中的所有对象，以创建Unix控件和Windows控件为例说明，我们需要一个抽象工厂下面有两个子工厂，一个叫做UnixFactory,用于生产Unix族控件，一个叫做WinFactory，用于生产Win族控件。抽象工厂与工厂方法的区别是，工厂方法中的具体工厂一般只生产一个或几个控件对象，而抽象工厂中的具体工厂生产的是一族控件对象。如图4所示。

![图4](http://upload-images.jianshu.io/upload_images/1598196-c9a6e8afe7c0b4a5?imageMogr2/auto-orient/strip)

######抽象工厂中的参与者：
**抽象工厂（Abstract Factory）角色:** 担任这个角色的是工厂方法模式的核心，它是与应用系统商业逻辑无关的。
**具体工厂（Concrete Factory）角色:**这个角色直接在客户端的调用下创建产品的实例。这个角色含有选择合适的产品对象的逻辑，而这个逻辑是与应用系统的商业逻辑紧密相关的。
**抽象产品（Abstract Product）角色:**担任这个角色的类是工厂方法模式所创建的对象的父类，或它们共同拥有的接口。
**具体产品（Concrete Product）角色:**抽象工厂模式所创建的任何产品对象都是某一个具体产品类的实例。这是客户端最终需要的东西，其内部一定充满了应用系统的商业逻辑。
 
#####抽象工厂的使用场景：
* 一个系统不应当依赖于产品类实例如何被创建、组合和表达的细节，这对于所有形态的工厂模式都是重要的。
* 这个系统有多于一个的产品族，而系统只消费其中某一产品族。
同属于同一个产品族的产品是在一起使用的，这一约束必须在系统的设计中体现出来。
* 系统提供一个产品类的库，所有的产品以同样的接口出现，从而使客户端不依赖于实现。

 
######抽象工厂模式与工厂方法模式的区别：
**工厂方法模式:**每个抽象产品派生多个具体产品类，每个抽象工厂类派生多个具体工厂类，每个具体工厂类负责一个具体产品的实例创建；
 **抽象工厂模式:**每个抽象产品派生多个具体产品类，每个抽象工厂派生多个具体工厂类，每个具体工厂负责多个（一系列）具体产品的实例创建。 

一样的，下面使用早餐店来举例:

```
AFFactory.h 抽象工厂角色

#import "AFOperation.h"
@interface AFFactory : NSObject
typedef NS_ENUM(NSInteger, AFFactoryProductType){
    AFFactoryProductTypeMantou,
    AFFactoryProductTypeYoutiao,
};
+ (instancetype)factoryWithType:(AFFactoryProductType)type;
- (AFOperation *)createProduct;
```

```
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
```

```
AFOperation.h 抽象产品角色

@interface AFOperation : NSObject
@property (nonatomic, copy, readonly)NSString *product;
- (void)productBreakfast;
@end
```

```
@implementation AFOperation
- (void)productBreakfast{
}
@end
```

```
AFFactoryMantou.h 具体工厂角色

@interface AFFactoryMantou : AFFactory
@end
```

```
AFFactoryMantou.m

#import "AFOperationMantou.h"
@implementation AFFactoryMantou
- (AFOperation *)createProduct{
    return [[AFOperationMantou alloc] init];
}
@end
```

```
@interface AFOperationMantou : AFOperation
@end
```

```
@implementation AFOperationMantou
@synthesize product = _product;
- (void)productBreakfast{
    _product = @"馒头";
}
@end
```
**main函数调用**
```
AFFactory *afFactory = [AFFactory factoryWithType:AFFactoryProductTypeMantou];
AFOperation *afOperation = [afFactory createProduct];
[afOperation productBreakfast];
NSLog(@"生产产品;%@",afOperation.product);
```

使用AFFacytory来创建工厂，屏蔽了内部的实现，你可以不用管内部是使用的馒头工厂还是油条工厂。你需要关注的就是他们公有的接口就行了。抽象工厂的最大好处在于，让你感觉不到内部差异性。cocoa框架里到处都是使用了这种设计。比如NSString、NSNumber。(这方面可以查阅cocoa的**类簇**这个概念来了解相关资料)当然，缺点就是，如果你修改了抽象类的方法，那么所有的子类都要跟着一起修改。

总结:从简单工厂模式到工厂模式，再到抽象工厂模式。可以看到整个模式的一步步演进。简单工厂模式在产品多样之后，整个工厂将会变得臃肿而难以维护。于是我们将简单工厂模式中的工程做了抽象处理，这样每种产品对应一个工厂。这样无疑会增加代码量。但是好处是显而易见的，单独让一个工厂处理一种产品会让逻辑变得好维护。但是这样还不够，因为增加新的品类，就会产生新的类，对于调用者来说，处理太多具有相同接口的类显然是不合算的。于是，我们使用抽象工厂模式来解决这个问题。我们让抽象工厂内部做一个封装，用以隐藏真正的具体工厂。这样，对于调用者来说，即时内部增加了新的产品，你也是不知道的。


参考资料
[iOS常用设计模式](http://blog.csdn.net/casablaneca/article/details/39851457#objc) <br>
[iOS应用设计模式开发中对简单工厂和工厂方法模式的运用](http://www.jb51.net/article/81497.htm)<br>
[IOS设计模式浅析之抽象工厂模式](http://www.cnblogs.com/eagle927183/p/3479644.html)<br>
[[设计模式深入学习IOS版(4)抽象工厂模式](http://blog.csdn.net/developer_zhang/article/details/19619927)](http://blog.csdn.net/developer_zhang/article/details/19619927?utm_source=tuicool&utm_medium=referral)<br>


