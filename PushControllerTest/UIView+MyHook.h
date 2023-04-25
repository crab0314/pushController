//
//  UIView+MyHook.h
//  PushControllerTest
//
//  Created by kiki on 2023/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MyHook)
- (void)my_setFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
