//
//  InputViewController.m
//  PushControllerTest
//
//  Created by kiki on 2023/4/19.
//

#import "InputViewController.h"

@interface View : UIView

@end

@implementation View

- (void)didMoveToSuperview {
    NSLog(@"this = %@", self.superview);
}

@end

@interface InputViewController ()

@property (nonatomic, strong) UITextField* editorView;

@property (nonatomic, strong) View *thisView;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    _editorView = [[UITextField alloc] init];
    _editorView.placeholder = @"test";
    _editorView.clearButtonMode = UITextFieldViewModeWhileEditing;
    _editorView.keyboardType = UIKeyboardTypeNumberPad;
    _editorView.frame = CGRectMake(200, 200, 100, 100);
    
    
    [self.view addSubview:_editorView];
    
    [_editorView becomeFirstResponder];
    
}

- (UIView *)view {
    if (!_thisView) {
        _thisView = [[View alloc] init];
    }
    return _thisView;
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}




@end
