//
//	FACNewsItemCell.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-02-06.
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

#import "FACNewsItemCell.h"
#import <LYCategory/LYCategory.h>
#import <Masonry/Masonry.h>
#import <LYFactAppCommon/LYFactAppCommon.h>


NSString *const FACNewsItemCellIdentifier = @"FACNewsItemCellIdentifier";


@interface FACNewsItemCell () {}
@end

@implementation FACNewsItemCell

- (void)didInitializeWithStyle:(UITableViewCellStyle)style {
	[super didInitializeWithStyle:style];
	
	{
		// MARK: BOTTOM LINE
		LYLine *view = [LYLine lineWithColor:[UIColor groupTableViewBackgroundColor]];
		[self addSubview:view];
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(self).offset(FAC_PADDING);
			make.right.equalTo(self).offset(-FAC_PADDING);
			make.bottom.equalTo(self);
			make.height.mas_equalTo(PixelOne);
		}];
	}
	
	{
		// MARK: TITLE LABEL
		UILabel *view = [[UILabel alloc] init];
		view.textColor = [UIColor darkGrayColor];
		view.font = [UIFont systemFontOfSize:15];
		[self addSubview:view];
		_lblTitle = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.left.equalTo(self).offset(FAC_PADDING);
		}];
	}
	
	{
		// MARK: AUTHOR LABEL
		UILabel *view = [[UILabel alloc] init];
		view.textColor = [UIColor grayColor];
		view.font = [UIFont systemFontOfSize:13];
		[self addSubview:view];
		_lblAuthor = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(self).offset(FAC_PADDING);
			make.bottom.equalTo(self).offset(-FAC_PADDING);
		}];
	}
	
	{
		// MARK: ATTACH PHOTO
		UIImageView *view = [[UIImageView alloc] init];
		[view roundedCornerRadius:3];
		[self addSubview:view];
		_ivPic = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self).offset(FAC_PADDING);
			make.right.bottom.equalTo(self).offset(-FAC_PADDING);
			make.height.mas_equalTo(70);
			make.width.equalTo(view.mas_height).multipliedBy(1.5);
		}];
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// CONFIGURE THE VIEW FOR THE SELECTED STATE
}

@end
