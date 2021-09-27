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
#import <LYFactAppCommon/LYFactAppCommon.h>


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
		UIView *view = [[UIView alloc] init];
		self.backgroundColor = [UIColor clearColor];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.backgroundColor = [UIColor whiteColor];
		[view roundedCornerRadius:4];
		[self addSubview:view];
		vCont = view;
		
        [view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [view.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [view.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
	}
	
	{
		// MARK: PICTURE VIEW
		UIImageView *view = [[UIImageView alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.contentMode = UIViewContentModeScaleAspectFill;
		[vCont addSubview:view];
		_ivPic = view;
		
        [view.topAnchor constraintEqualToAnchor:vCont.topAnchor].active = YES;
        [view.leftAnchor constraintEqualToAnchor:vCont.leftAnchor].active = YES;
        [view.rightAnchor constraintEqualToAnchor:vCont.rightAnchor].active = YES;
        [view.heightAnchor constraintEqualToAnchor:view.widthAnchor].active = YES;
	}
	
	{
		// MARK: TITLE LABEL
		UILabel *view = [[UILabel alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.textColor = [UIColor darkGrayColor];
		view.font = [UIFont systemFontOfSize:14];
		[vCont addSubview:view];
		_lblTitle = view;
        
        [view.topAnchor constraintEqualToAnchor:_ivPic.bottomAnchor constant:10].active = YES;
        [view.leftAnchor constraintEqualToAnchor:vCont.leftAnchor constant:10].active = YES;
        [view.rightAnchor constraintEqualToAnchor:vCont.rightAnchor constant:-10].active = YES;
	}
	
	{
		// MARK: PRICE LABEL
		UILabel *view = [[UILabel alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		view.font = [UIFont systemFontOfSize:13];
		view.textColor = [UIColor redColor];
		[vCont addSubview:view];
		_lblPrice = view;
		
        [view.topAnchor constraintEqualToAnchor:_lblTitle.bottomAnchor constant:10].active = YES;
        [view.leftAnchor constraintEqualToAnchor:vCont.leftAnchor constant:10].active = YES;
	}
	
	{
		// MARK: ACTION CONTROL
		UIControl *view = [[UIControl alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
		[view roundedCornerRadius:15];
		[vCont addSubview:view];
		_cAsk = view;
		
        [view.rightAnchor constraintEqualToAnchor:vCont.rightAnchor constant:-10].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:vCont.bottomAnchor constant:-10].active = YES;
        [view.widthAnchor constraintEqualToConstant:30].active = YES;
        [view.heightAnchor constraintEqualToConstant:30].active = YES;

		[_cAsk addTarget:self action:@selector(askButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
}

@end
