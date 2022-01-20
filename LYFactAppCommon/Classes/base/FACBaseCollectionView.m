//
//	FACBaseCollectionView.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-01-19.
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

#import "FACBaseCollectionView.h"
#import <LYFactAppCommon/LYFactAppCommon.h>


@implementation FACBaseCollectionView

// MARK: - INIT

- (instancetype)init {
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	if (self = [super initWithFrame:CGRectZero collectionViewLayout:layout]) {
		[self initial];
	}
	return self;
}

- (instancetype)initWithLayout:(UICollectionViewLayout *)layout {
	if (self = [super initWithFrame:CGRectZero collectionViewLayout:layout]) {
		[self initial];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
	if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
		[self initial];
	}
	return self;
}

- (void)initial {
	
	self.backgroundColor = [UIColor clearColor];
	
	if ([self.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
		__weak UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)(self.collectionViewLayout);
		layout.minimumLineSpacing = 0;
		layout.minimumInteritemSpacing = 0;
	}
}

@end
