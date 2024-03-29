//
//	FACBaseCollectionCell.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2018-10-30.
//	Copyright (c) 2018~2021 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "FACBaseCollectionCell.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


NSString *const FACBaseCollectionCellIdentifier = @"FACBaseCollectionCellIdentifier";

@implementation FACBaseCollectionCell

// MARK: - INIT

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initial];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		// -initial BEING CALLED ON -awakeFromNib
	}
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self initial];
}

- (void)initial {
}

// MARK: - METHOD

- (void)setupValues:(id)data {
}

// MARK: - OVERWRITE

/**
 overwrite -description

 @return description string.
 */
- (NSString *)description {
	return [NSString stringWithFormat:@"%@ > %@ > %@",
			NSStringFromClass([self class]),	// Class name
			NSStringFromCGRect(self.frame),		// View frame
			([[self superview] isKindOfClass:[UICollectionView class]] ? [(UICollectionView *)[self superview] indexPathForCell:self] : @"UNKNOWN IDP")	// Cell index-path
			];
}

@end
