//
//  FACBaseVC.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-02-01.
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

#import "FACBaseVC.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@interface FACBaseVC () {}
@end

@implementation FACBaseVC

// MARK: - ACTION

// MARK: - INIT

- (instancetype)init {
    if (self = [super init]) {
        [self initial];
    }
    return self;
}

- (void)initial {
}

+ (UINavigationController *)nav {
	FACBaseNavVC *navc = [[FACBaseNavVC alloc] initWithRootViewController:[[[self class] alloc] init]];
	return navc;
}

// MARK: VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	self.view.backgroundColor = [UIColor whiteColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	return lightStatusbar ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}

// MARK: MEMORY MANAGEMENT

/*
- (void)dealloc {
}
*/

// MARK: - METHOD

- (void)updateStatusbarLight:(BOOL)lightStyle {
	lightStatusbar = lightStyle;
	[self setNeedsStatusBarAppearanceUpdate];
}

// MARK: PRIVATE METHOD

// MARK: PROPERTY

// MARK: BLOCK

// MARK: - DELEGATE

// MARK:

// MARK: - NOTIFICATION

@end

// MARK: - FACBaseHideNavbarVC
@implementation FACBaseHideNavbarVC

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES animated:animated];
	[self setNeedsStatusBarAppearanceUpdate];
}

@end

// MARK: - FACBaseShowNavbarVC
@implementation FACBaseShowNavbarVC

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:NO animated:animated];
	[self setNeedsStatusBarAppearanceUpdate];
}

@end
