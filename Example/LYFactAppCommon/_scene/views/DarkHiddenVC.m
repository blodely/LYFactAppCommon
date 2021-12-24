//
//  DarkHiddenVC.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2021-12-24.
//	Copyright (c) 2019-2021 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "DarkHiddenVC.h"


@interface DarkHiddenVC () {}
@end

@implementation DarkHiddenVC

- (void)backButtonPressed:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)initial {
	[super initial];
	
	lightStatusbar = NO;
}

- (void)loadView {
	[super loadView];
	
	self.view.backgroundColor = [UIColor darkGrayColor];
	
	{
		UIButton *view = [UIButton buttonWithType:UIButtonTypeSystem];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.backgroundColor = [UIColor whiteColor];
		[view border1Px];
		[self.view addSubview:view];
		[view addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		
		[view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
		[view.widthAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
		[view.heightAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
	}
}

@end
