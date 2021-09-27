//
//  LYViewController.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-02-01.
//	Copyright (c) 2019 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "LYViewController.h"
#import <LYFactAppCommon/LYFactAppCommon.h>
#import "LYTableViewController.h"
#import "LYCollectViewController.h"


@interface LYViewController () {}
@end

@implementation LYViewController

- (void)buttonPressed:(id)sender {
    [self.navigationController pushViewController:[[LYCollectViewController alloc] init] animated:YES];
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW, TYPICALLY FROM A NIB.
    
    {
        UIControl *view = [UIControl new];
        view.backgroundColor = [UIColor grayColor];
        [self.view addSubview:view];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [view.layer setBorderColor:view.tintColor.CGColor];
        [view.layer setBorderWidth:1];
        [view addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:FAC_PADDING].active = YES;
        [view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-FAC_PADDING].active = YES;
        [view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:FAC_PADDING].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:0].active = YES;
    }
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// DISPOSE OF ANY RESOURCES THAT CAN BE RECREATED.
}

@end
