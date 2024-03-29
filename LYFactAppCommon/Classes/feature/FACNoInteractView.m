//
//	FACNoInteractView.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-01-06.
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

#import "FACNoInteractView.h"
#import <LYCategory/LYCategory.h>
#import <LYFactAppCommon/LYFactAppCommon.h>


@implementation FACNoInteractView

// MARK: - INIT

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.userInteractionEnabled = NO;
		[self initial];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		self.userInteractionEnabled = NO;
		[self initial];
	}
	return self;
}

- (instancetype)initWithHexColor:(NSString *)color andAlpha:(CGFloat)alpha {
	if (self = [super init]) {
		self.userInteractionEnabled = NO;
		self.backgroundColor = [UIColor colorWithHex:color andAlpha:alpha];
		[self initial];
	}
	return self;
}

- (instancetype)initWithHexColor:(NSString *)color {
	if (self = [super init]) {
		self.userInteractionEnabled = NO;
		self.backgroundColor = [UIColor colorWithHex:color andAlpha:1];
		[self initial];
	}
	return self;
}

- (void)initial {
}

// MARK: - METHOD

// MARK: PROPERTY

- (void)setDebug:(BOOL)debug {
	_debug = debug;
	
	if (_debug) {
		[self border1Px];
	} else {
		[self removeBorder];
	}
	
	for (id one in self.subviews) {
		if ([one isKindOfClass:[UIView class]] && [one respondsToSelector:@selector(setDebug:)]) {
			[one setDebug:_debug];
		}
	}
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled {
	[super setUserInteractionEnabled:NO];
}

@end
