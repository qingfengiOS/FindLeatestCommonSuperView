//
//  ViewController.m
//  FindLeatestCommonSuperView
//
//  Created by 情风 on 2018/7/9.
//  Copyright © 2018年 qingfengiOS. All rights reserved.
//

#import "ViewController.h"
#import "ViewA.h"
#import "ViewC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     ViewA继承自ViewB，ViewB继承自ViewD； ViewC继承自ViewD
     so：ViewA和ViewC的最近公共父View为ViewD
     */
    
    Class resClass = [self commonClass:[ViewA class] classB:[ViewC class]];
    NSLog(@"resClass = %@", resClass);
}

- (NSArray *)superClass:(Class)class {
    
    if (class == nil) {
        return @[];
    }
    NSMutableArray *result = [NSMutableArray array];
    while (class != nil) {
        [result addObject:class];
        class = [class superclass];
    }
    return [result copy];
}

- (Class)commonClass:(Class)classA classB:(Class)classB {
    NSArray *arrayA = [self superClass:classA];
    NSArray *arrayB = [self superClass:classB];
    
    //way1:
//    for (int i = 0; i < arrayA.count; i++) {
//        Class targetClass = arrayA[i];
//        for (int j = 0; j < arrayB.count; j++) {
//            if (targetClass == arrayB[j]) {
//                return targetClass;
//            }
//        }
//    }
    
    
    //way2:使用Set
    NSSet *set = [NSSet setWithArray:arrayA];
    for (Class class in arrayB) {
        if ([set containsObject:class]) {
            return class;
        }
    }
    return nil;
}




@end
