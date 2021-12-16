//
//  FACWebVC.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2021-12-15.
//	Copyright (c) 2021 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "FACWebVC.h"
#import <LYCategory/LYCategory.h>


@interface FACWebVC () {}
@end

@implementation FACWebVC

// MARK: - INIT

- (void)initial {
	[super initial];
	
	wkConfig = [[WKWebViewConfiguration alloc] init];
}

// MARK: - VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	{
		WKWebView *view = [[WKWebView alloc] initWithFrame:CGRectZero configuration:wkConfig];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self.view addSubview:view];
		wkWeb = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
	}
}

// MARK: - METHOD
// MARK: PRIVATE METHOD
// MARK: PROPERTY

- (void)setURLString:(NSString *)URLString {
	if (URLString == nil || [URLString isEmpty]) {
		_URLString = nil;
	} else {
		_URLString = URLString;
	}
}

// MARK: BLOCK
// MARK: - DELEGATE
// MARK:
// MARK: - NOTIFICATION
// MARK:

@end
