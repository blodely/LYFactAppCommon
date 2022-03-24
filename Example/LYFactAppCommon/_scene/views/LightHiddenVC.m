//
//  LightHiddenVC.m
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

#import "LightHiddenVC.h"


@interface LightHiddenVC () {}
@end

@implementation LightHiddenVC

- (void)backButtonPressed:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)initial {
	[super initial];
	
	lightStatusbar = YES;
}

- (void)loadView {
	[super loadView];
	
	{
		// MARK: Navigation view
		FACBaseNavView *view = [[FACBaseNavView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.lblTitle.text = @"LHN ViewController";
		[self.view addSubview:view];
		
		[view navBackAction:^{
			[self.navigationController popViewControllerAnimated:YES];
		}];
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
		
		// FOR TESTING PURPOSE, DISPLAY VIEW'S BORDER
		[view border1Px];
		[view.btnBack border1Px];
	}
	
	{
		// MARK: Rounded Textfield view
		FACRoundedTextField *view = [[FACRoundedTextField alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.textfield;
		[self.view addSubview:view];
		
		[view border1Px];
		
		[view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:100].active = YES;
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:FAC_PADDING].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-FAC_PADDING].active = YES;
	}
}

@end
