//
//	FACBaseNavView.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-02-17.
//	Copyright (c) 2022 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "FACBaseNavView.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@interface FACBaseNavView () {
	__strong LYCCompletion blockBack;
	__strong LYCCompletion blockTitle;
}
@end

@implementation FACBaseNavView

// MARK: - ACTION

- (void)backButtonPressed:(id)sender {
	if (blockBack != nil) {
		blockBack();
	} else {
		NSLog(@"BLOCK NOT FOUND");
	}
}

// MARK: - INIT

- (instancetype)initWithFrame:(CGRect)frame {
	frame.origin = CGPointZero;
	frame.size.width = WIDTH;
	frame.size.height = SAFE_TOP + FAC_CTL_SIDE;
	if (self = [super initWithFrame:frame]) {}
	return self;
}

- (void)initial {
	[super initial];
	
	{
		// MARK: BACK BUTTON
		FACImageControl *view = [[FACImageControl alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_btnBack = view;
		
		[view addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
		[view.widthAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
		[view.heightAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
		
		[view.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = YES;
	}
	
	{
		// MARK: TITLE LABEL
		FACLabelControl *view = [[FACLabelControl alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.font = [UIFont boldSystemFontOfSize:UIFont.systemFontSize];
		[self addSubview:view];
		_lblTitle = view;
		
		[view.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
		[view.centerYAnchor constraintEqualToAnchor:_btnBack.centerYAnchor].active = YES;
	}
}

// MARK: - METHOD

// MARK: BLOCK

- (void)navBackAction:(void (^)(void))action {
	blockBack = action;
}

@end
