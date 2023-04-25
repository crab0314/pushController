//
//  CALayer+MyHook.h
//  PushControllerTest
//
//  Created by kiki on 2023/4/21.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (MyHook)
- (void)my_setFrame:(CGRect)frame;
- (void)my_setBounds:(CGRect)bounds;
@end

NS_ASSUME_NONNULL_END
