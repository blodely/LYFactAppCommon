//
//	UINavigationController+FAC.h
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2022-01-04.
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

#import <UIKit/UIKit.h>


@interface UINavigationController (FAC)

/// Configure view controller's tab bar item title, image, selected image at once.
/// @param title title string
/// @param iconName image name
/// @param iconSelected selected image name
- (void)setTabBarItemTitle:(NSString *)title andImageNamed:(NSString *)iconName selectedImageNamed:(NSString *)iconSelected;

/// Configure view controller's tab bar item title, image(original rendered), selected image(original rendered) at once.
/// @param title title string
/// @param iconName image name
/// @param iconSelected selected image name
- (void)setTabBarItemTitle:(NSString *)title andOriginalImageNamed:(NSString *)iconName selectedOriginalImageNamed:(NSString *)iconSelected;

@end
