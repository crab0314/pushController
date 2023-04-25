//
//  ViewController.m
//  PushControllerTest
//
//  Created by kiki on 2023/4/19.
//

#import "ViewController.h"
#import "InputViewController.h"
#import "CustomTransitionAnimator.h"

@interface ViewController () // <UIViewControllerInteractiveTransitioning,UINavigationControllerDelegate>//<UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning> //<UIViewControllerTransitioningDelegate>

@property (strong) InputViewController *inputViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [[UIButton alloc] init];
    [button addTarget:self action:@selector(p_addClick:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1;
    button.layer.backgroundColor = [UIColor whiteColor].CGColor;
    button.frame = CGRectMake(200, 200, 100, 100);
    button.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:button];
}

- (void)p_addClick:(id)sender {
    InputViewController *inputViewController = [[InputViewController alloc] init];
    //[self.navigationController pushViewController:inputViewController animated:YES];
//    self.inputViewController = inputViewController;
//    inputViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//    inputViewController.transitioningDelegate = self;
//    self.navigationController.delegate = inputViewController;
    [self.navigationController pushViewController:inputViewController animated:YES];
    //[self presentViewController:inputViewController animated:YES completion:nil];
    
}

#pragma mark - UIViewControllerTransitioningDelegate



//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
//    return self;
//}
//
//- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    NSLog(@"kiki debug:");
//}

//- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   animationControllerForOperation:(UINavigationControllerOperation)operation
//                                                fromViewController:(UIViewController *)fromVC
//                                                           toViewController:(UIViewController *)toVC {
//    return self;
//}
//
//- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
//    return 0.5;
//}
//
//
//- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *containerView = [transitionContext containerView];
//
//    // 设置初始frame
//    CGRect initialFrame = containerView.bounds;
//    toViewController.view.frame = CGRectOffset(initialFrame, initialFrame.size.width, 0);
//
//    [containerView addSubview:toViewController.view];
//
//    // 设置动画
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        fromViewController.view.frame = CGRectOffset(initialFrame, -initialFrame.size.width, 0);
//        toViewController.view.frame = initialFrame;
//
//        NSLog(@"kiki debug: containerView x = %f", containerView.frame.origin.x);
//        NSLog(@"kiki debug: containerView y = %f", containerView.frame.origin.y);
//        NSLog(@"kiki debug: containerView width = %f", containerView.frame.size.width);
//        NSLog(@"kiki debug: containerView height = %f", containerView.frame.size.height);
//
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//    }];
//}

@end
