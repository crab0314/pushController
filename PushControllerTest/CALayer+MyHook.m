//
//  CALayer+MyHook.m
//  PushControllerTest
//
//  Created by kiki on 2023/4/21.
//

#import "CALayer+MyHook.h"
#import <objc/runtime.h>

@implementation CALayer (MyHook)

+ (void)load {
    Method originalMethod = class_getInstanceMethod([CALayer class], @selector(setFrame:));
    Method swizzledMethod = class_getInstanceMethod([CALayer class], @selector(my_setFrame:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
    Method originalMethod1 = class_getInstanceMethod([CALayer class], @selector(setBounds:));
    Method swizzledMethod1 = class_getInstanceMethod([CALayer class], @selector(my_setBounds:));
    method_exchangeImplementations(originalMethod1, swizzledMethod1);
    
    Method originalMethod2 = class_getInstanceMethod([CALayer class], @selector(setAnchorPoint:));
    Method swizzledMethod2 = class_getInstanceMethod([CALayer class], @selector(my_setAnchorPoint:));
    method_exchangeImplementations(originalMethod2, swizzledMethod2);
}

- (void)my_setFrame:(CGRect)frame {
    NSLog(@"CALayer setFrame is hooked! frame = %@ width = %f height = %f x = %f y = %f" , self, frame.size.width, frame.size.height, frame.origin.x, frame.origin.y);
    [self my_setFrame:frame];
}
- (void)my_setBounds:(CGRect)bounds {
    NSLog(@"CALayer setBounds is hooked! frame = %@ width = %f height = %f x = %f y = %f" , self, bounds.size.width, bounds.size.height, bounds.origin.x, bounds.origin.y);
    [self my_setBounds:bounds];
}

- (void)my_setAnchorPoint:(CGPoint)anchorPoint {
    NSLog(@"CALayer setFrame is hooked! frame = %@ x = %f y = %f" , self, anchorPoint.x, anchorPoint.y);
    [self my_setAnchorPoint:anchorPoint];
}

- (void)my_setTransform:(CATransform3D)transform {
    
}

@end
