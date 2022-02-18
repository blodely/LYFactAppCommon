//
//  FACPopBaseView.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-01-09.
//	Copyright (c) 2019~2022 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "FACPopBaseView.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@implementation FACPopBaseView

// MARK: - ACTION

- (void)backgroundTapped:(id)sender {
	if (self.disableBackgroundTouchDismiss == NO) {
		[self dismiss];
	}
}

// MARK: - INIT

- (instancetype)initWithFrame:(CGRect)frame {
	frame.origin = CGPointZero;
	frame.size = (CGSize){WIDTH, HEIGHT};
	if (self = [super initWithFrame:frame]) {
	}
	return self;
}

- (void)initial {
	[super initial];
	
	{
		_disableBackgroundTouchDismiss = NO;
	}
	
	{
		FACBaseControl *view = [[FACBaseControl alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.backgroundColor = [UIColor colorWithWhite:0 alpha:GOLDEN_RATIO];
		[self addSubview:view];
		cBg = view;
		
		[view addTarget:self action:@selector(backgroundTapped:) forControlEvents:UIControlEventTouchUpInside];
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
	}
	
	{
		FACBaseView *view = [[FACBaseView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		vContent = view;
	}
}

+ (instancetype)pop {
	return [[[self class] alloc] init];
}

// MARK: - METHOD

- (void)show {
	self.hidden = YES;
	if ([self superview] == nil) {
		[[UIApplication sharedApplication].keyWindow addSubview:self];
	}
	self.hidden = NO;
}

- (void)dismiss {
	[self dismiss:^{}];
}

- (void)dismiss:(void (^)(void))completed {
	self.hidden = YES;
	
	if (completed != nil) {
		completed();
	}
	
	[self removeFromSuperview];
}

// MARK: PRIVATE METHOD

@end
