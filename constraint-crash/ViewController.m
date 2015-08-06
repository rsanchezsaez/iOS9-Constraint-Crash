//
//  ViewController.m
//  constraint-crash
//
//  Created by Ricardo Sánchez-Sáez on 07/08/2015.
//  Copyright © 2015 Ricardo Sánchez-Sáez. All rights reserved.
//

#import "ViewController.h"


@interface ViewControllerView : UIView

@end


@implementation ViewControllerView {
    UIView *_colorView;
    NSMutableArray *_currentConstraints;
    BOOL _isRedColor;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self reAddRedView];
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)reAddRedView {
    [_colorView removeFromSuperview];
    _colorView = [UIView new];
    
    if (_isRedColor) {
        _colorView.backgroundColor = [UIColor greenColor];
    } else {
        _colorView.backgroundColor = [UIColor redColor];
    }
    _isRedColor = !_isRedColor;
    
    _colorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_colorView];
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    [NSLayoutConstraint deactivateConstraints:_currentConstraints];
    [_currentConstraints removeAllObjects];
    
    if (!_currentConstraints) {
        _currentConstraints = [NSMutableArray new];
    }
    
    [_currentConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[redView]-100-|"
                                             options:0
                                             metrics:nil
                                               views:@{ @"redView": _colorView }]];
    [_currentConstraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[redView]-100-|"
                                             options:0
                                             metrics:nil
                                               views:@{ @"redView": _colorView }]];

    [NSLayoutConstraint activateConstraints:_currentConstraints];
      
    [super updateConstraints];
}

@end



@interface ViewController ()

@end


@implementation ViewController

- (void)loadView {
    self.view = [ViewControllerView new];
    UIButton *reloadViewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [reloadViewButton setTitle:@"Reload Views" forState:UIControlStateNormal];
    [reloadViewButton addTarget:self.view action:@selector(reAddRedView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reloadViewButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
