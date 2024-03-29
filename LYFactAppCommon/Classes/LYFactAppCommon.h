//
//  LYFactAppCommon.h
//	LYFactAppCommon
//
//	CREATED BY LUO YU ON 2019-02-01.
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <LYCategory/LYCategory.h>
#import <JLRoutes/JLRoutes.h>

// MARK: - GENERAL IMPORTS

#import <LYFactAppCommon/FACBaseView.h>
#import <LYFactAppCommon/FACBaseControl.h>
#import <LYFactAppCommon/FACBaseNavView.h>
#import <LYFactAppCommon/FACBaseTableView.h>
#import <LYFactAppCommon/FACBaseCollectionView.h>
#import <LYFactAppCommon/FACBaseFlowCollectionView.h>

#import <LYFactAppCommon/FACNoInteractView.h>
#import <LYFactAppCommon/FACImageControl.h>
#import <LYFactAppCommon/FACImageToggle.h>
//#import <LYFactAppCommon/FACInnerShadowLabel.h> // DISABLED
#import <LYFactAppCommon/FACLabelControl.h>
#import <LYFactAppCommon/FACGradientView.h>
#import <LYFactAppCommon/FACGradientControl.h>
#import <LYFactAppCommon/FACBlurView.h>
#import <LYFactAppCommon/FACPopBaseView.h>
#import <LYFactAppCommon/FACDatePickerPop.h>
//#import <LYFactAppCommon/FACRangeSlider.h> // DISABLED
#import <LYFactAppCommon/FACEmpty.h>
#import <LYFactAppCommon/FACRoundedTextField.h>
#import <LYFactAppCommon/FACTestButton.h>

#import <LYFactAppCommon/FACBorderTableCell.h>
#import <LYFactAppCommon/FACBannerCell.h>
#import <LYFactAppCommon/FACMenuItemCell.h>
#import <LYFactAppCommon/FACNewsItemCell.h>
#import <LYFactAppCommon/FACMerchandiseCell.h>
#import <LYFactAppCommon/FACAlbumCell.h>
#import <LYFactAppCommon/FACHomeMenuItemCell.h>
#import <LYFactAppCommon/FACChatBaseCell.h>

#import <LYFactAppCommon/NSString+Router.h>
#import <LYFactAppCommon/UIApplication+Router.h>
#import <LYFactAppCommon/UINavigationController+FAC.h>
#import <LYFactAppCommon/UIImageView+FactAppCommon.h>
#import <LYFactAppCommon/FACImageControl+FactAppCommon.h>

#import <LYFactAppCommon/FACModel.h>
#import <LYFactAppCommon/FACApp.h>

#import <LYFactAppCommon/FACBaseVC.h>
#import <LYFactAppCommon/FACBaseHideNavbarVC.h>
#import <LYFactAppCommon/FACBaseShowNavbarVC.h>
#import <LYFactAppCommon/FACBaseNavVC.h>
#import <LYFactAppCommon/FACBaseTabBarVC.h>
#import <LYFactAppCommon/FACBaseTableCell.h>
#import <LYFactAppCommon/FACBaseCollectionCell.h>

#import <LYFactAppCommon/FACLocalContentVC.h>
#import <LYFactAppCommon/FACWebVC.h>

#import <LYFactAppCommon/FACBaseEmptyVC.h>


// MARK: - CONSTANTS

/// 15.0f
FOUNDATION_EXPORT CGFloat const FAC_PADDING;

/// 8.0f
FOUNDATION_EXPORT CGFloat const FAC_SPACING;

/// 20.0f
FOUNDATION_EXPORT CGFloat const FAC_CORNER;

/// 44.0f
FOUNDATION_EXPORT CGFloat const FAC_CTL_SIDE;

/// 36.0f
FOUNDATION_EXPORT CGFloat const FAC_CTL_SMALL;

// MARK: - BLOCKS

// MARK: - CLASS

@interface LYFactAppCommon : NSObject

@end
