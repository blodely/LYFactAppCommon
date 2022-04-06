//
//	FACChatBaseCell.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-03-24.
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

#import "FACChatBaseCell.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


// MARK: - FACChatBaseCell

@implementation FACChatBaseCell

// MARK: INIT

- (void)initial {
	[super initial];
	
	{
		// MARK: MESSAGE CONTENT LABEL
		FACLabelControl *view = [[FACLabelControl alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.numberOfLines = 0;
		[self addSubview:view];
		_lblContent = view;
	}
}

// MARK: METHOD

// MARK: PRIVATE METHOD

// MARK: PROPERTY

- (FACChatBaseCellSide)side {
	return pSide;
}

@end

// MARK: - FACChatBaseLeftCell

@implementation FACChatBaseLeftCell

- (void)initial {
	[super initial];
	
	pSide = FACChatBaseCellSideLeft;
}

@end

// MARK: - FACChatBaseRightCell

@implementation FACChatBaseRightCell

- (void)initial {
	[super initial];
	
	pSide = FACChatBaseCellSideRight;
}

@end
