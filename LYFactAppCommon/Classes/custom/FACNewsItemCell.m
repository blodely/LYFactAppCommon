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
#import <LYFactAppCommon/LYFactAppCommon.h>


NSString *const FACNewsItemCellIdentifier = @"FACNewsItemCellIdentifier";


@interface FACNewsItemCell () {}
@end

@implementation FACNewsItemCell

- (void)initial {
    [super initial];

	{
		// MARK: BOTTOM LINE
        UIView *view = [[UIView alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
		[self addSubview:view];
        
        [view.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:FAC_PADDING].active = YES;
        [view.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-FAC_PADDING].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [view.heightAnchor constraintEqualToConstant:1 / SCALE].active = YES;
	}
	
	{
		// MARK: TITLE LABEL
		UILabel *view = [[UILabel alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.textColor = [UIColor darkGrayColor];
		view.font = [UIFont systemFontOfSize:15];
		[self addSubview:view];
		_lblTitle = view;
		
        [view.topAnchor constraintEqualToAnchor:self.topAnchor constant:FAC_PADDING];
        [view.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:FAC_PADDING];
	}
	
	{
		// MARK: AUTHOR LABEL
		UILabel *view = [[UILabel alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.textColor = [UIColor grayColor];
		view.font = [UIFont systemFontOfSize:13];
		[self addSubview:view];
		_lblAuthor = view;
		
        [view.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:FAC_PADDING].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-FAC_PADDING].active = YES;
	}
	
	{
		// MARK: ATTACH PHOTO
		UIImageView *view = [[UIImageView alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = YES;
		[view roundedCornerRadius:3];
		[self addSubview:view];
		_ivPic = view;
		
        [view.topAnchor constraintEqualToAnchor:self.topAnchor constant:FAC_PADDING].active = YES;
        [view.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-FAC_PADDING].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-FAC_PADDING].active = YES;
        [view.heightAnchor constraintEqualToConstant:70].active = YES;
        [view.widthAnchor constraintEqualToAnchor:view.heightAnchor multiplier:1.5].active = YES;
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// CONFIGURE THE VIEW FOR THE SELECTED STATE
}

@end
