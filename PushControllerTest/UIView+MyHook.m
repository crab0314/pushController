//
//  UIView+MyHook.m
//  PushControllerTest
//
//  Created by kiki on 2023/4/21.
//

#import "UIView+MyHook.h"
#import <objc/runtime.h>

@implementation UIView (MyHook)

+ (void)load {
    Method originalMethod = class_getInstanceMethod([UIView class], @selector(setFrame:));
    Method swizzledMethod = class_getInstanceMethod([UIView class], @selector(my_setFrame:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)my_setFrame:(CGRect)frame {
    NSLog(@"UIView setFrame is hooked! frame width = %f height = %f x = %f y = %f", frame.size.width, frame.size.height, frame.origin.x, frame.origin.y);
    [self my_setFrame:frame];
}

@end
