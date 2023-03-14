//
//  FACInnerShadowLabel.m
//  LYFactAppCommon
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "FACInnerShadowLabel.h"
#import <LYCategory/LYCategory.h>
#import <CoreText/CoreText.h>


@implementation FACInnerShadowLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.text == nil || [self.text isEmpty]) {
        return;
    }
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGImageRef alphamask = NULL;
    CGRect textrect;
    CTFrameRef frameref = [self framerefTextrect:&textrect];
    
    // INVERT
    CGContextTranslateCTM(context, 0.0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1.0, -1.0);
    
    {
        // PREPARE MASK
        CGContextSaveGState(context);
        
        CGContextSetTextDrawingMode(context, kCGTextFill);
        
        [[UIColor whiteColor] setFill];
        CTFrameDraw(frameref, context);
        
        alphamask = CGBitmapContextCreateImage(context);
        
        // CLEAR CONTENT
        CGContextClearRect(context, rect);
        
        CGContextRestoreGState(context);
    }
    
    {
        CGContextSaveGState(context);
        
        // CLIP THE CURRENT CONTEXT TO ALPHA MASK
        CGContextClipToMask(context, rect, alphamask);
        
        // INVERT INNER SHADOW
        CGContextTranslateCTM(context, 0.0, CGRectGetHeight(rect));
        CGContextScaleCTM(context, 1.0, -1.0);

        // INNER SHADOW
        CGImageRef shadowimg = [self inverseFromAlphaMask:alphamask rect:rect];
        CGContextSetShadowWithColor(context, self.innerShadowOffset, self.innerShadowBlur, self.innerShadowColor.CGColor);
        CGContextSetBlendMode(context, kCGBlendModeDarken);
        CGContextDrawImage(context, rect, shadowimg);
        
        CGImageRelease(shadowimg);
        
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext(); // APPLY ALL STYLES
    UIGraphicsEndImageContext(); // END CONTEXT
    [image drawInRect:rect];
    
    CGImageRelease(alphamask);
    CFRelease(frameref);
}

- (CTFrameRef)framerefTextrect:(CGRect *)rectop CF_RETURNS_RETAINED {
    CGSize size = self.bounds.size;
    
    // FONT
    CTFontRef fontRef = CTFontCreateWithFontDescriptor((__bridge CTFontDescriptorRef)self.font.fontDescriptor, self.font.pointSize, NULL);
    CTTextAlignment alignment = NSTextAlignmentToCTTextAlignment(self.textAlignment);

    CTLineBreakMode lineBreakMode = (CTLineBreakMode)self.lineBreakMode;
    CGFloat lineSpacing = 0;
    CGFloat letterSpacing = 0;
    CTParagraphStyleSetting paragraphStyleSettings[] = {
        {kCTParagraphStyleSpecifierAlignment, sizeof(CTTextAlignment), &alignment},
        {kCTParagraphStyleSpecifierLineBreakMode, sizeof(CTLineBreakMode), &lineBreakMode},
//        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing}
    };
    CTParagraphStyleRef paragraphStyleRef = CTParagraphStyleCreate(paragraphStyleSettings, 3);
    CFNumberRef kernRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberCGFloatType, &letterSpacing);
    
    // ATTRIBUTED
    CFStringRef keys[] = {kCTFontAttributeName, kCTParagraphStyleAttributeName, kCTForegroundColorAttributeName, kCTKernAttributeName};
    CFTypeRef values[] = {fontRef, paragraphStyleRef, self.textColor.CGColor, kernRef};
    CFDictionaryRef attributes = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, sizeof(keys) / sizeof(keys[0]), &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFRelease(fontRef);
    CFRelease(paragraphStyleRef);
    CFRelease(kernRef);
    
    CFStringRef stringRef = (CFStringRef)CFBridgingRetain(self.text);
    CFAttributedStringRef attributedStringRef = CFAttributedStringCreate(kCFAllocatorDefault, stringRef, attributes);
    CFRelease(stringRef);
    CFRelease(attributes);
    
    // FRAME
    CTFramesetterRef framesetterRef = CTFramesetterCreateWithAttributedString(attributedStringRef);
    CFRelease(attributedStringRef);
    
    CGRect contentRect = (CGRect){CGPointZero, size};
    CGRect textRect = [self textRectFromContentRect:contentRect framesetterRef:framesetterRef];
    if (rectop) {
        *rectop = textRect;
    }
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddRect(pathRef, NULL, textRect);
    
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetterRef, CFRangeMake(0, self.text.length), pathRef, NULL);
    CFRelease(framesetterRef);
    CGPathRelease(pathRef);
    
    return frameRef;
}

- (CGRect)textRectFromContentRect:(CGRect)contentRect framesetterRef:(CTFramesetterRef)framesetterRef {
    CGSize suggestedTextRectSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetterRef, CFRangeMake(0, self.text.length), NULL, contentRect.size, NULL);
    if (CGSizeEqualToSize(suggestedTextRectSize, CGSizeZero)) {
        suggestedTextRectSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetterRef, CFRangeMake(0, self.text.length), NULL, CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX), NULL);
    }
    CGRect textRect = CGRectMake(0.0, 0.0, ceilf(suggestedTextRectSize.width), ceilf(suggestedTextRectSize.height));
    
    // HORIZONTAL
    switch (self.textAlignment) {
        case NSTextAlignmentCenter:
            textRect.origin.x = floorf(CGRectGetMinX(contentRect) + (CGRectGetWidth(contentRect) - CGRectGetWidth(textRect)) / 2.0);
            break;
            
        case NSTextAlignmentRight:
            textRect.origin.x = floorf(CGRectGetMinX(contentRect) + CGRectGetWidth(contentRect) - CGRectGetWidth(textRect));
            break;
            
        case NSTextAlignmentNatural:
            if ([UIView userInterfaceLayoutDirectionForSemanticContentAttribute:self.semanticContentAttribute] == UIUserInterfaceLayoutDirectionRightToLeft) {
                textRect.origin.x = floorf(CGRectGetMinX(contentRect) + CGRectGetWidth(contentRect) - CGRectGetWidth(textRect));
            } else {
                textRect.origin.x = floorf(CGRectGetMinX(contentRect));
            }
            break;
            
        default:
            textRect.origin.x = floorf(CGRectGetMinX(contentRect));
            break;
    }
    
    // VERTICAL (REVERSED)
    switch (self.contentMode) {
        case UIViewContentModeTop:
        case UIViewContentModeTopLeft:
        case UIViewContentModeTopRight:
            textRect.origin.y = floorf(CGRectGetMinY(contentRect) + CGRectGetHeight(contentRect) - CGRectGetHeight(textRect));
            break;
            
        case UIViewContentModeBottom:
        case UIViewContentModeBottomLeft:
        case UIViewContentModeBottomRight:
            textRect.origin.y = floorf(CGRectGetMinY(contentRect));
            break;
            
        default:
            textRect.origin.y = floorf(CGRectGetMinY(contentRect) + floorf((CGRectGetHeight(contentRect) - CGRectGetHeight(textRect)) / 2.0));
            break;
    }
    
    return textRect;
}

- (CGImageRef)inverseFromAlphaMask:(CGImageRef)alphamask rect:(CGRect)rect CF_RETURNS_RETAINED {
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor whiteColor] setFill];
    UIRectFill(rect); // FILL
    CGContextClipToMask(context, rect, alphamask); // CLIP 2 ALPHA
    CGContextClearRect(context, rect);
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    UIGraphicsEndImageContext();
    return image;
}


@end
