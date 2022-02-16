//
//	FACApp.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-02-15.
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

#import "FACApp.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@interface FACApp () {}
@end

@implementation FACApp

// MARK: - INIT

+ (instancetype)current {
	static FACApp *sharedFacApp;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedFacApp = [[FACApp alloc] init];
	});
	return sharedFacApp;
}

- (instancetype)init {
	if (self = [super init]) {
		self.uniqueID = @"space.luoyu.dimo";
		_loggedIn = NO;
	}
	return self;
}

// MARK: CODING & COPYING

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		self.loggedIn = [coder decodeBoolForKey:@"self.loggedIn"];
	}
	return self;
}

- (id)copyWithZone:(NSZone *)zone {
	FACApp *app = (FACApp *)[super copyWithZone:zone];
	
	if (app != nil) {
		app.loggedIn = self.isLoggedIn;
	}
	
	return app;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[super encodeWithCoder:coder];
	
	[coder encodeBool:self.isLoggedIn forKey:@"self.loggedIn"];
}

// MARK: - METHOD
// MARK: PRIVATE METHOD
// MARK: PROPERTY
// MARK: BLOCK

@end
