//
//  CustomTransitionAnimator.m
//  PushControllerTest
//
//  Created by kiki on 2023/4/20.
//

#import "CustomTransitionAnimator.h"

@implementation CustomTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5; // 设置转场动画的持续时间
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 设置初始frame
    CGRect initialFrame = containerView.bounds;
    toViewController.view.frame = CGRectOffset(initialFrame, initialFrame.size.width, 0);
    
    [containerView addSubview:toViewController.view];
    
    // 设置动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.frame = CGRectOffset(initialFrame, -initialFrame.size.width, 0);
        toViewController.view.frame = initialFrame;
        
        NSLog(@"kiki debug: containerView x = @f", containerView.frame.origin.x);
        NSLog(@"kiki debug: containerView y = @f", containerView.frame.origin.y);
        NSLog(@"kiki debug: containerView width = @f", containerView.frame.size.width);
        NSLog(@"kiki debug: containerView height = @f", containerView.frame.size.height);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
