//
//	FACImageControl+FactAppCommon.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-01-28.
//	COPYRIGHT (C) 2022 骆昱(Luo Yu, indie.luo@gmail.com). ALL RIGHTS RESERVED.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.
//

#import "FACImageControl+FactAppCommon.h"
#import <UIKit/UIKit.h>
#import <LYFactAppCommon/LYFactAppCommon.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/AFAutoPurgingImageCache.h>
#import <AFNetworking/AFImageDownloader.h>


@implementation FACImageControl (FactAppCommon)

- (void)setImageWithURLString:(NSString *)URLString andPlaceholderNamed:(NSString *)imageName {
	[self.imageView setImageWithURLString:URLString andPlaceholderNamed:imageName];
}

- (void)setImageWithURLString:(NSString *)URLString andPlaceholderNamed:(NSString *)imageName inBundle:(NSBundle *)bundle {
	
	if (URLString == nil || ![URLString isKindOfClass:[NSString class]] || [URLString isEqualToString:@""]) {
		self.imageView.image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
		return;
	}
	
	[self.imageView setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:[UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil]];
}

- (void)setImageWithURLString:(NSString *)URLString andPlaceholder:(UIImage *)image {
	
	if (URLString == nil || ![URLString isKindOfClass:[NSString class]] || [URLString isEqualToString:@""]) {
		self.imageView.image = image;
		return;
	}
	
	[self.imageView setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:image];
}

@end
