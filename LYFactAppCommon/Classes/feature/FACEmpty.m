//
//	FACEmpty.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-02-07.
//	Copyright (c) 2018~2022 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "FACEmpty.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@interface FACEmpty () {}
@end

@implementation FACEmpty

// MARK: - INIT

- (instancetype)initWithFrame:(CGRect)frame {
	frame.origin.x = 0;
	frame.size.width = WIDTH;
	if (self = [super initWithFrame:frame]) {
	}
	return self;
}

- (void)initial {
	[super initial];
	
	{
		self.hidden = YES;
		self.userInteractionEnabled = NO;
		_type = FACEmptyTypeDefault;
	}
	
	{
		// MARK: PICTURE IMAGE VIEW
		UIImageView *view = [[UIImageView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_ivPic = view;
		
		[view.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
		
		[view.widthAnchor constraintGreaterThanOrEqualToConstant:FAC_CTL_SIDE].active = YES;
		[view.heightAnchor constraintGreaterThanOrEqualToConstant:FAC_CTL_SIDE].active = YES;
	}
	
	{
		// MARK: HINT LABEL
		UILabel *view = [[UILabel alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.numberOfLines = 0;
		view.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
		view.textAlignment = NSTextAlignmentCenter;
		view.textColor = [UIColor lightGrayColor];
		[self addSubview:view];
		_lblTitle = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
		[view.widthAnchor constraintEqualToConstant:WIDTH].active = YES;
		[view.topAnchor constraintEqualToAnchor:_ivPic.bottomAnchor constant:FAC_PADDING].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
	}
}

// MARK: - METHOD

// MARK: PROPERTY

- (void)setImage:(UIImage *)image {
	_ivPic.image = image;
}

- (UIImage *)image {
	return _ivPic.image;
}

- (void)setText:(NSString *)text {
	_lblTitle.text = text;
}

- (NSString *)text {
	return _lblTitle.text;
}

- (void)setFont:(UIFont *)font {
	_lblTitle.font = font;
}

- (UIFont *)font {
	return _lblTitle.font;
}

- (void)setTextColor:(UIColor *)textColor {
	_lblTitle.textColor = textColor;
}

- (UIColor *)textColor {
	return _lblTitle.textColor;
}

@end
