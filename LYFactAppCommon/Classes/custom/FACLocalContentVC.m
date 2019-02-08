//
//	FACLocalContentVC.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-02-08.
//	Copyright (c) 2019 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "FACLocalContentVC.h"
#import <WebKit/WebKit.h>
#import <LYCore/LYCore.h>
#import <LYCategory/LYCategory.h>
#import <Masonry/Masonry.h>


@interface FACLocalContentVC () {
	
	__weak WKWebView *web;
}
@end

@implementation FACLocalContentVC

// MARK: - ACTION

// MARK: - INIT

- (void)didInitialize {
	[super didInitialize];
	
	self.hidesBottomBarWhenPushed = YES;
}

// MARK: VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	{
		WKWebViewConfiguration *webconf = [[WKWebViewConfiguration alloc] init];
		
		WKWebView *view = [[WKWebView alloc] initWithFrame:CGRectZero configuration:webconf];
		[self.view addSubview:view];
		web = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self.view);
		}];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW.
	
	if (_ctTitle != nil) {
		self.navigationItem.title = _ctTitle;
	}
	
	if (_ctPage != nil) {
		[web loadHTMLString:_ctPage baseURL:[NSURL URLWithString:@"http://open.luoyu.space"]];
	}
}

@end
