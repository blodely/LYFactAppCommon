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
#import <LYCategory/LYCategory.h>
#import <Masonry/Masonry.h>


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
		view.backgroundColor = [UIColor whiteColor];
		[self addSubview:view];
		vFrame = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.left.right.equalTo(self);
			make.height.equalTo(view.mas_width).multipliedBy(0.667);
		}];
	}
	
	{
		// MARK: PHOTO VIEW
		UIImageView *view = [[UIImageView alloc] init];
		view.contentMode = UIViewContentModeScaleAspectFill;
		view.clipsToBounds = YES;
		[vFrame addSubview:view];
		_ivCover = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self->vFrame).insets(UIEdgeInsetsMake(8, 8, 8, 8));
		}];
	}
	
	{
		UILabel *view = [[UILabel alloc] init];
		view.textAlignment = NSTextAlignmentCenter;
		view.font = [UIFont systemFontOfSize:14];
		view.textColor = [UIColor grayColor];
		[self addSubview:view];
		_lblTitle = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self->vFrame.mas_bottom).offset(8);
			make.left.right.equalTo(self);
		}];
	}
}

@end
