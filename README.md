# pushController

Hello everyone.

There is a problem that has bothered me for a long time recently.

I have two controllers, let's call them controllerA and controllerB. When I click some button in controllerA, I want to push controllerB into the navigation. Besides, I need some UITextField get the focus automatically when I enter controllerB. The code is very simple.



@implementation ControllerA 

-(void)p_addClick:(id)sender {
    ControllerB *controllerB = [[ControllerB alloc] init];
    [self.navigationController pushViewController:controllerB animated:YES];
}
@end

@implementation ControllerB 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    _editorView = [[UITextField alloc] init];
    _editorView.placeholder = @"test";
    _editorView.clearButtonMode = UITextFieldViewModeWhileEditing;
    _editorView.frame = CGRectMake(200, 200, 100, 100);
    [_editorView becomeFirstResponder]; /* This is the point code */
    [self.view addSubview:_editorView];
    
}

@end



If I code like this, then controllerB will first come out a little from the right of the screen, then go back, and finally show completely. It seems that the screen is shaking a little.

I test on some OS and found that only 16.0 and above models will behave like this, 15.5 and below is very smooth.

I think this seems to be a system bug, but don't know how to fix it.

I try to call becomeFirstResponder in the method of viewDidAppear in controllerB, then everything is OK. But there's many cases like this. Changing every controller seems not elegant enough.
