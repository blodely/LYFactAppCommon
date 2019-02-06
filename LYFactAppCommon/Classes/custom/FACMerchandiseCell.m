//
//	FACMerchandiseCell.m
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

#import "FACMerchandiseCell.h"
#import <LYCategory/LYCategory.h>
#import <Masonry/Masonry.h>


NSString *const FACMerchandiseCellIdentifier = @"FACMerchandiseCellIdentifier";


@interface FACMerchandiseCell () {
}
@end

@implementation FACMerchandiseCell

// MARK: - ACTION

- (void)askButtonTapped:(id)sender {
	if ([self.delegate respondsToSelector:@selector(askActionInFACMerchandiseCell:)]) {
		[self.delegate askActionInFACMerchandiseCell:self];
	} else {
		NSLog(@"DELEGATE NOT FOUND");
	}
}

// MARK: - INIT

- (void)initial {
	[super initial];
	
	{
		// MARK: CONTAINER VIEW
		LYView *view = [LYView view];
		self.backgroundColor = [UIColor clearColor];
		view.backgroundColor = [UIColor whiteColor];
		[view roundedCornerRadius:4];
		[self addSubview:view];
		vCont = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self);
		}];
	}
	
	{
		// MARK: PICTURE VIEW
		UIImageView *view = [[UIImageView alloc] init];
		view.contentMode = UIViewContentModeScaleAspectFill;
		[vCont addSubview:view];
		_ivPic = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.left.right.equalTo(self->vCont);
			make.height.equalTo(view.mas_width);
		}];
	}
	
	{
		// MARK: TITLE LABEL
		UILabel *view = [[UILabel alloc] init];
		view.textColor = [UIColor darkGrayColor];
		view.font = [UIFont systemFontOfSize:14];
		[vCont addSubview:view];
		_lblTitle = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self->_ivPic.mas_bottom).offset(10);
			make.left.equalTo(self->vCont).offset(10);
			make.right.equalTo(self->vCont).offset(-10);
		}];
	}
	
	{
		// MARK: PRICE LABEL
		UILabel *view = [[UILabel alloc] init];
		view.font = [UIFont systemFontOfSize:13];
		view.textColor = [UIColor redColor];
		[vCont addSubview:view];
		_lblPrice = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self->_lblTitle.mas_bottom).offset(10);
			make.left.equalTo(self->vCont).offset(10);
		}];
	}
	
	{
		// MARK: ACTION CONTROL
		UIControl *view = [[UIControl alloc] init];
		[view roundedCornerRadius:15];
		[vCont addSubview:view];
		_cAsk = view;
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.right.bottom.equalTo(self->vCont).offset(-10);
			make.width.height.mas_equalTo(30);
		}];
		
		[_cAsk addTarget:self action:@selector(askButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
}

@end
