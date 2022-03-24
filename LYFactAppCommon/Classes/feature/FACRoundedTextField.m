//
//	FACRoundedTextField.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-03-24.
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

#import "FACRoundedTextField.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@implementation FACRoundedTextField

// MARK: - INIT

- (void)initial {
	[super initial];
	
	{
		// MARK: HEIGHT
		_height = 36.0f;
		
		UILayoutGuide *guide = [[UILayoutGuide alloc] init];
		[self addLayoutGuide:guide];
		guideHeight = guide;
		
		[guide.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
		[guide.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
		[guide.heightAnchor constraintEqualToConstant:_height].active = YES;
	}
	
	{
		self.backgroundColor = [UIColor colorWithHex:@"#f2f2f2" andAlpha:1];
		[self roundedCornerRadius:floor( _height * 0.5 )];
	}
	
	{
		// MARK: 输入框 视图
		UITextField *view = [[UITextField alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:view];
		_textfield = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:FAC_PADDING].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
	}
}

// MARK: - PROPERTY

- (void)setHeight:(CGFloat)height {
	_height = height;
	
	[self roundedCornerRadius:floor( _height * 0.5 )];
	[guideHeight.heightAnchor constraintEqualToConstant:_height].active = YES;
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
	_textfield.delegate = delegate;
}

- (id<UITextFieldDelegate>)delegate {
	return _textfield.delegate;
}

- (void)setFont:(UIFont *)font {
	_textfield.font = font;
}

- (UIFont *)font {
	return _textfield.font;
}

- (void)setPlaceholder:(NSString *)placeholder {
	_textfield.placeholder = placeholder;
}

- (NSString *)placeholder {
	return _textfield.placeholder;
}

- (void)setText:(NSString *)text {
	_textfield.text = text;
}

- (NSString *)text {
	return _textfield.text;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
	_textfield.textAlignment = textAlignment;
}

- (NSTextAlignment)textAlignment {
	return _textfield.textAlignment;
}

- (void)setTextColor:(UIColor *)textColor {
	_textfield.textColor = textColor;
}

- (UIColor *)textColor {
	return _textfield.textColor;
}

@end
