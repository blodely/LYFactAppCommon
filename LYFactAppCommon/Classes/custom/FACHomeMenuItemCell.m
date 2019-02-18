//
//	FACHomeMenuItemCell.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-02-12.
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

#import "FACHomeMenuItemCell.h"
#import <Masonry/Masonry.h>


NSString *const FACHomeMenuItemCellIdentifier = @"FACHomeMenuItemCellIdentifier";

@interface FACHomeMenuItemCell () {}
@end

@implementation FACHomeMenuItemCell

- (void)initial {
	[super initial];
	
	{
		UIImageView *view = [[UIImageView alloc] init];
		view.contentMode = UIViewContentModeScaleAspectFit;
		[self addSubview:view];
		_ivIcon = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self).offset(4);
			make.left.right.equalTo(self);
			make.height.mas_equalTo(26);
		}];
	}
	
	{
		UILabel *view = [[UILabel alloc] init];
		view.textAlignment = NSTextAlignmentCenter;
		view.font = [UIFont systemFontOfSize:15];
		[self addSubview:view];
		_lblTitle = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self->_ivIcon.mas_bottom).offset(6);
			make.left.right.equalTo(self);
			make.height.mas_equalTo(18);
			make.bottom.equalTo(self).offset(6);
		}];
	}
}

@end
