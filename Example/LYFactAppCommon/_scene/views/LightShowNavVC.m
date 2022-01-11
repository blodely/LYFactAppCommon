//
//  LightShowNavVC.m
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

#import "LightShowNavVC.h"
#import <LYFactAppCommon/FACRangeSlider.h>


@interface LightShowNavVC () {
	
	__weak FACNoInteractView *noInteractView;
	__weak FACGradientView *gradientView;
	__weak FACRangeSlider *rangeSlider;
}
@end

@implementation LightShowNavVC

- (void)initial {
	[super initial];
	
	lightStatusbar = YES;
}

- (void)loadView {
	[super loadView];
	
	{
		// MARK: INTERACTION DISABLED VIEW
		FACNoInteractView *view = [[FACNoInteractView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[view border1Px];
		[self.view addSubview:view];
		noInteractView = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:FAC_PADDING].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:FAC_PADDING * 6].active = YES;
		[view.widthAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
		[view.heightAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
	}
	
	{
		// MARK: GRADIENT VIEW
		FACGradientView *view = [[FACGradientView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		
		view.colors = @[
			[UIColor colorWithHex:@"#f0b6f2" andAlpha:1],
			[UIColor colorWithHex:@"#b6c4f2" andAlpha:1],
		];
		
		[view border1Px];
		[self.view addSubview:view];
		gradientView = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:FAC_PADDING].active = YES;
		[view.topAnchor constraintEqualToAnchor:noInteractView.bottomAnchor constant:FAC_PADDING].active = YES;
		[view.widthAnchor constraintEqualToConstant:FAC_CTL_SIDE * 2].active = YES;
		[view.heightAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
	}
	
	{
		FACRangeSlider *view = [[FACRangeSlider alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[view border1Px];
		[self.view addSubview:view];
		rangeSlider = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:FAC_PADDING].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-FAC_PADDING].active = YES;
		[view.topAnchor constraintEqualToAnchor:gradientView.bottomAnchor constant:FAC_PADDING].active = YES;
		
		{
			[view.leftThumb border1Px];
			[view.rightThumb border1Px];
			[view.trackBackground border1Px];
		}
	}
}

@end
