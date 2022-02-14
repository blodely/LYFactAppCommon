//
//	FACLabelControl.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-05-26.
//	COPYRIGHT (C) 2019~2022 骆昱(Luo Yu, indie.luo@gmail.com). ALL RIGHTS RESERVED.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.
//

#import "FACLabelControl.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@implementation FACLabelControl

// MARK: - INIT

- (void)initial {
	[super initial];
	
	self.backgroundColor = [UIColor clearColor];
	
	{
		// MARK: Label
		UILabel *view = [[UILabel alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_label = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
	}
}

// MARK: - METHOD

// MARK: PROPERTY

- (void)setFont:(UIFont *)font {
	_label.font = font;
}

- (UIFont *)font {
	return _label.font;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
	_label.numberOfLines = numberOfLines;
}

- (NSInteger)numberOfLines {
	return _label.numberOfLines;
}

- (void)setText:(NSString *)text {
	_label.text = text;
}

- (NSString *)text {
	return _label.text;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
	_label.textAlignment = textAlignment;
}

- (NSTextAlignment)textAlignment {
	return _label.textAlignment;
}

- (void)setTextColor:(UIColor *)textColor {
	_label.textColor = textColor;
}

- (UIColor *)textColor {
	return _label.textColor;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
	_label.attributedText = attributedText;
}

- (NSAttributedString *)attributedText {
	return _label.attributedText;
}

@end
