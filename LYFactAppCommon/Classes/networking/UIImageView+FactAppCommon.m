//
//	UIImageView+FactAppCommon.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2017-03-01. (LYCore)
//	Copyright (c) 2017~2022 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "UIImageView+FactAppCommon.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/AFAutoPurgingImageCache.h>
#import <AFNetworking/AFImageDownloader.h>


@implementation UIImageView (FactAppCommon)

- (void)setImageWithURLString:(NSString *)URLString andPlaceholderNamed:(NSString *)imageName {
	
	// SET PLACEHOLDER IMAGE AT FIRST
	dispatch_async(dispatch_get_main_queue(), ^{
		[self setImage:[UIImage imageNamed:imageName]];
	});
	
	if (URLString == nil || ![URLString isKindOfClass:[NSString class]] || [URLString isEqualToString:@""]) {
		// URL STRING NOT VALID
		return;
	}
	
	NSString *imgIdentifier = [URLString lastPathComponent];
	AFImageDownloader *imgdl = [AFImageDownloader defaultInstance];
	
	UIImage *memCached = [imgdl.imageCache imageforRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]] withAdditionalIdentifier:imgIdentifier];
	
	if (!memCached) {
		// NO MEMORY IMAGE CACHE WAS FOUND
		
		// SEARCH FOR HDD IMAGE CACHE
		NSURLCache *imgURLCache = imgdl.sessionManager.session.configuration.URLCache;
		NSCachedURLResponse *cachedResp = [imgURLCache cachedResponseForRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];
		
		if (cachedResp != nil && cachedResp.data != nil && [UIImage imageWithData:cachedResp.data] != nil) {
			// FOUND HDD CACHE
			dispatch_async(dispatch_get_main_queue(), ^{
				[self setImage:[UIImage imageWithData:cachedResp.data]];
			});
		} else {
			// NOTHING WAS FOUND
			// REQUEST FROM WEB
			[self setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:[UIImage imageNamed:imageName]];
		}
		
	} else {
		dispatch_async(dispatch_get_main_queue(), ^{
			[self setImage:memCached];
		});
	}
}

- (void)setImageWithURLString:(NSString *)URLString andPlaceholderNamed:(NSString *)imageName inBundle:(NSBundle *)bundle {
	
	if (URLString == nil || ![URLString isKindOfClass:[NSString class]] || [URLString isEqualToString:@""]) {
		self.image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
		return;
	}
	
	[self setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:[UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil]];
}

- (void)setImageWithURLString:(NSString *)URLString andPlaceholder:(UIImage *)image {
	
	if (URLString == nil || ![URLString isKindOfClass:[NSString class]] || [URLString isEqualToString:@""]) {
		self.image = image;
		return;
	}
	
	[self setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:image];
}

- (void)setAnimationImageURLs:(NSArray<NSString *> *)animationImgURLs {
	// TODO: IMAGE URLS TO SHOW AS ANIMATION
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		NSMutableArray *imgs = [NSMutableArray arrayWithCapacity:1];
		for (NSInteger i = 0; i < [animationImgURLs count]; i++) {
			NSString *URL = animationImgURLs[i];
			if ([[URL lowercaseString] hasPrefix:@"http://"] && [[URL lowercaseString] hasPrefix:@"https://"]) {
				NSData *dimg = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
				if (dimg != nil) {
					UIImage *image = [UIImage imageWithData:dimg];
					[imgs addObject:image];
				}
			}
		}
		NSArray *ret = [NSArray arrayWithArray:imgs];
		dispatch_async(dispatch_get_main_queue(), ^{
			self.animationImages = ret;
		});
	});
}

@end
