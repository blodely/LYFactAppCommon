//
//	FACModel.m
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2021-12-14.
//	Copyright (c) 2019~2021 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
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

#import "FACModel.h"
#import <LYCategory/LYCategory.h>
#import <LYFactAppCommon/LYFactAppCommon.h>


@interface FACModel () {}
@end

@implementation FACModel

// MARK: - INIT

// MARK: CODING & COPYING

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
		self.uniqueID = [coder decodeObjectForKey:@"self.uniqueID"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.uniqueID forKey:@"self.uniqueID"];
}

- (id)copyWithZone:(NSZone *)zone {
	FACModel *copy = [[[self class] allocWithZone:zone] init];
	
	if (copy != nil) {
		copy.uniqueID = self.uniqueID;
	}
	
	return copy;
}

// MARK: - METHOD

// MARK: PRIVATE METHOD

// MARK: - OVERRIDE

- (NSString *)description {
	return [NSString stringWithFormat:@"%@ -> UniqueID=%@", NSStringFromClass([self class]), _uniqueID];
}

@end

// MARK: - Persistence

@implementation FACModel (Persistence)

- (BOOL)persist {
	
	// CREATE FOLDER IF IT'S NOT EXIST
	[NSFileManager createFolderIfNotExistInDocuments:NSStringFromClass([self class])];
	
	if (self.uniqueID == nil || [self.uniqueID isEmpty]) {
		// NOT A HEALTH MODEL INSTANCE
		return NO;
	}
	
	NSString *modelpath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@/%@", NSStringFromClass([self class]), self.uniqueID];
	
	if ([NSFileManager isFileExistAtPath:modelpath]) {
		// FILE ALREADY EXIST
		// THEN, DELETE
		[[NSFileManager defaultManager] removeItemAtPath:modelpath error:NULL];
	}
	
	BOOL result = [NSKeyedArchiver archiveRootObject:self toFile:modelpath];
	
	return result;
}

- (NSString *)pathToPersist {
	if (self.uniqueID == nil || [self.uniqueID isEmpty]) {
		// NOT A HEALTH MODEL INSTANCE
		return nil;
	}
	
	return [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@/%@", NSStringFromClass([self class]), self.uniqueID];
}

@end

// MARK: - Creation

@implementation FACModel (Creation)

+ (instancetype)modelWithRaw:(id)rawdata {
	return nil;
}

+ (NSArray *)modelsWithRaw:(id)rawdata {
	return nil;
}

@end
