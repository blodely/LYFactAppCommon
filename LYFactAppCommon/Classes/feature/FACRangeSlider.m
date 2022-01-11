//
//	FACRangeSlider.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-01-10.
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

#import "FACRangeSlider.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


typedef void(^FACRangeSliderValueChangedBlock)(CGFloat minimum, CGFloat maximum);

@interface FACRangeSlider () {
	
	__strong FACRangeSliderValueChangedBlock blockValues;
}
@end

@implementation FACRangeSlider

// MARK: - ACTION

- (void)panGestureTriggered:(UIPanGestureRecognizer *)sender {
	NSLog(@"pan");
	
	
	CGPoint loc = [sender locationInView:self];
	CGPoint trans = [sender translationInView:self];
	
	if (sender.state == UIGestureRecognizerStateBegan) {
		// TOUCH BEGIN
		[self callChanged];
		return;
	}
	
	if (sender.state == UIGestureRecognizerStateChanged) {
		// TOUCH CONTINUE
		[self callChanged];
		return;
	}
	
	if (sender.state == UIGestureRecognizerStateEnded) {
		// TOUCH END
		[self callChanged];
		return;
	}
}

// MARK: - INIT

- (void)initial {
	[super initial];
	
	{
		self.backgroundColor = [UIColor clearColor];
		self.clipsToBounds = YES;
		
		[self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureTriggered:)]];
	}
	
	{
		// MARK: TRACK BG IMAGE
		UIImageView *view = [[UIImageView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_trackBackground = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
		[view.heightAnchor constraintEqualToConstant:4].active = YES;
		[view.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
	}
	
	{
		// MARK: TRACK SELECTION IMAGE
		UIImageView *view = [[UIImageView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_trackSelection = view;
		
		[view.topAnchor constraintEqualToAnchor:_trackBackground.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:_trackBackground.bottomAnchor].active = YES;
	}
	
	{
		// MARK: LEFT THUMB IMAGE
		UIImageView *view = [[UIImageView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_leftThumb = view;
		
		[view.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
		[view.leadingAnchor constraintGreaterThanOrEqualToAnchor:_trackBackground.leadingAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
		
		[view.widthAnchor constraintEqualToConstant:FAC_CTL_SMALL].active = YES;
		[view.heightAnchor constraintEqualToConstant:FAC_CTL_SMALL].active = YES;
	}
	
	{
		// MARK: RIGHT THUMB IMAGE
		UIImageView *view = [[UIImageView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_rightThumb = view;
		
		[view.topAnchor constraintEqualToAnchor:_leftThumb.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:_leftThumb.bottomAnchor].active = YES;
		[view.widthAnchor constraintEqualToAnchor:_leftThumb.widthAnchor].active = YES;
		[view.heightAnchor constraintEqualToAnchor:_leftThumb.heightAnchor].active = YES;
		[view.leadingAnchor constraintGreaterThanOrEqualToAnchor:_leftThumb.trailingAnchor].active = YES;
		[view.trailingAnchor constraintLessThanOrEqualToAnchor:_trackBackground.trailingAnchor].active = YES;
	}
	
	{
		[_trackSelection.leadingAnchor constraintEqualToAnchor:_leftThumb.trailingAnchor].active = YES;
		[_trackSelection.trailingAnchor constraintEqualToAnchor:_rightThumb.leadingAnchor].active = YES;
	}
}

// MARK: - METHOD

- (void)callChanged {
	if (blockValues != nil) {
		blockValues(_minimum, _maximum);
	}
}

// MARK: BLOCK

- (void)valueChanged:(void (^)(CGFloat, CGFloat))actionBlock {
	blockValues = actionBlock;
}

// MARK: - OVERWRITE

//- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//	return YES;
//}
//
//- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//	return YES;
//}
//
//- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//}

@end
