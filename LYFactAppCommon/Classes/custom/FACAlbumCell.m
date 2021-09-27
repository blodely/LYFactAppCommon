//
//	FACAlbumCell.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-02-07.
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

#import "FACAlbumCell.h"
#import <LYFactAppCommon/LYFactAppCommon.h>
#import <LYCategory/LYCategory.h>


NSString *const FACAlbumCellIdentifier = @"FACAlbumCellIdentifier";

@interface FACAlbumCell () {
	__weak UIView *vFrame;
}
@end

@implementation FACAlbumCell

- (void)initial {
	[super initial];
	
	self.backgroundColor = [UIColor clearColor];
	
	{
		// MARK: PHOTO FRAME
		UIView *view = [[UIView alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.backgroundColor = [UIColor whiteColor];
		[self addSubview:view];
		vFrame = view;
		
        [view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
        [view.heightAnchor constraintEqualToAnchor:view.widthAnchor multiplier:0.667].active = YES;
	}
	
	{
		// MARK: PHOTO VIEW
		UIImageView *view = [[UIImageView alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.contentMode = UIViewContentModeScaleAspectFill;
		view.clipsToBounds = YES;
		[vFrame addSubview:view];
		_ivCover = view;
		
        UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, -8, -8);
        [view.topAnchor constraintEqualToAnchor:vFrame.topAnchor constant:insets.top].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:vFrame.bottomAnchor constant:insets.bottom].active = YES;
        [view.leftAnchor constraintEqualToAnchor:vFrame.leftAnchor constant:insets.left].active = YES;
        [view.rightAnchor constraintEqualToAnchor:vFrame.rightAnchor constant:insets.right].active = YES;
	}
	
	{
		UILabel *view = [[UILabel alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.textAlignment = NSTextAlignmentCenter;
		view.font = [UIFont systemFontOfSize:14];
		view.textColor = [UIColor grayColor];
		[self addSubview:view];
		_lblTitle = view;
		
        [view.topAnchor constraintEqualToAnchor:vFrame.bottomAnchor constant:8].active = YES;
        [view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
	}
}

@end
