//
//  MainViewController.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2021-12-24.
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

#import "MainViewController.h"
#import "LightShowNavVC.h"
#import "LightHiddenVC.h"
#import "DarkHiddenVC.h"
#import "DarkShowNavVC.h"


@interface MainViewController () {}
@end

@implementation MainViewController

// MARK: - ACTION

- (IBAction)openLightHideNavButtonPressed:(id)sender {
	[self pushTo:[[LightHiddenVC alloc] init]];
}

- (IBAction)openLightShowNavbarButtonPressed:(id)sender {
	[self pushTo:[[LightShowNavVC alloc] init]];
}

- (IBAction)openDarkHiddenNavbarButtonPressed:(id)sender {
	[self pushTo:[[DarkHiddenVC alloc] init]];
}

- (IBAction)openDarkShowNavbarButtonPressed:(id)sender {
	[self pushTo:[[DarkShowNavVC alloc] init]];
}

// MARK: - INIT

- (instancetype)init {
	if (self = [super initWithNibName:@"MainViewController" bundle:nil]) {
		[self initial];
	}
	return self;
}

@end
