//
//    FACDatePickerPop.m
//    LYFactAppCommon
//
//    CREATED BY LUO YU ON 2023-03-09.
//    Copyright (c) 2019~2023 骆昱 (Luo Yu, blodely) <indie.luo@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.
//

#import "FACDatePickerPop.h"


@interface FACDatePickerPop () {
    
    __strong LYCDate blockDate;
}
@end

@implementation FACDatePickerPop

// MARK: - ACTION

- (void)doneButtonTapped:(id)sender {
    
    if (sender == _btnDone) {
        if (blockDate != nil) {
            blockDate(_picker.date);
            [self dismiss];
        }
        return;
    }
}

// MARK: - INIT

- (void)initial {
    [super initial];
    
    {
        self.disableBackgroundTouchDismiss = YES;
        vContent.backgroundColor = [UIColor whiteColor];
        
        [vContent.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
        [vContent.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
        [vContent.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    }
    
    {
        // MARK: DATE PICKER VIEW
        UIDatePicker *view = [[UIDatePicker alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.datePickerMode = UIDatePickerModeDate;
        view.preferredDatePickerStyle = UIDatePickerStyleWheels;
        [vContent addSubview:view];
        _picker = view;
        
        [view.leftAnchor constraintEqualToAnchor:vContent.leftAnchor].active = YES;
        [view.rightAnchor constraintEqualToAnchor:vContent.rightAnchor].active = YES;
        [view.bottomAnchor constraintEqualToAnchor:vContent.safeAreaLayoutGuide.bottomAnchor].active = YES;
        [view.heightAnchor constraintEqualToConstant:216].active = YES; // floor(216.0 / 375.0 * WIDTH)
        [view.topAnchor constraintEqualToAnchor:vContent.topAnchor constant:FAC_CTL_SIDE].active = YES;
    }
    
    {
        // MARK: CANCEL BUTTON
        UIButton *view = [UIButton buttonWithType:UIButtonTypeSystem];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [view setTitle:@"Cancel" forState:UIControlStateNormal];
        [vContent addSubview:view];
        _btnCancel = view;
        
        [_btnCancel addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        [view.leftAnchor constraintEqualToAnchor:vContent.leftAnchor constant:FAC_PADDING].active = YES;
        [view.topAnchor constraintEqualToAnchor:vContent.topAnchor].active = YES;
        [view.heightAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
    }
    
    {
        // MARK: DONE BUTTON
        UIButton *view = [UIButton buttonWithType:UIButtonTypeSystem];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [view setTitle:@"Done" forState:UIControlStateNormal];
        [vContent addSubview:view];
        _btnDone = view;
        
        [_btnDone addTarget:self action:@selector(doneButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [view.rightAnchor constraintEqualToAnchor:vContent.rightAnchor constant:-FAC_PADDING].active = YES;
        [view.topAnchor constraintEqualToAnchor:vContent.topAnchor].active = YES;
        [view.heightAnchor constraintEqualToConstant:FAC_CTL_SIDE].active = YES;
    }
}

// MARK: - METHOD
// MARK: BLOCK

- (void)datePickerFinished:(void (^)(NSDate *))actionblock {
    blockDate = actionblock;
}

@end
