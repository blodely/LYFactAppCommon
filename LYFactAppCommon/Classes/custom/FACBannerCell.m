//
//  FACBannerCell.m
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

#import "FACBannerCell.h"
#import <LYCategory/LYCategory.h>
#import <Masonry/Masonry.h>


NSString *const FACBannerCellIdentifier = @"FACBannerCellIdentifier";

@interface FACBannerCell () {
}
@end

@implementation FACBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self initial];
	}
	return self;
}

- (void)initial {
	
	{
		self.backgroundColor = [UIColor clearColor];
	}
	
	{
		// MARK: 容器 CONTAINER
		UIView *view = [[UIView alloc] init];
		[view roundedCornerRadius:6];
		[self addSubview:view];
		vCont = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self);
		}];
	}
	
	{
		// MARK: 照片 PHOTO
		UIImageView *view = [[UIImageView alloc] init];
		view.contentMode = UIViewContentModeScaleAspectFill;
		[vCont addSubview:view];
		_ivPhoto = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self->vCont);
		}];
	}
	
	{
		// MARK: 标签 LABEL
		UILabel *view = [[UILabel alloc] init];
		view.font = [UIFont systemFontOfSize:14];
		view.textAlignment = NSTextAlignmentRight;
		view.textColor = [UIColor whiteColor];
		view.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
		view.shadowOffset = (CGSize){1, 1};
		[vCont addSubview:view];
		_lblTitle = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.bottom.right.equalTo(self->vCont).offset(-6);
		}];
	}
}

@end
