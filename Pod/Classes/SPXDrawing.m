/*
   Copyright (c) 2014 Snippex. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY Snippex `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Snippex OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "SPXDrawing.h"

CGRect SPXRectCenterInRect(CGRect rect, CGRect alignmentRect, UIOffset offsets)
{
  CGRect frame = rect;
  frame = SPXRectCenterHorizontallyInRect(frame, alignmentRect, offsets.horizontal);
  frame = SPXRectCenterVerticallyInRect(frame, alignmentRect, offsets.vertical);
  return CGRectIntegral(frame);
}

CGRect SPXRectCenterHorizontallyInRect(CGRect rect, CGRect alignmentRect, CGFloat offset)
{
  CGRect frame = rect;
  frame.origin.x = CGRectGetMidX(alignmentRect) - CGRectGetMidX(rect);
  frame.origin.x += offset;
  return CGRectIntegral(frame);
}

CGRect SPXRectCenterVerticallyInRect(CGRect rect, CGRect alignmentRect, CGFloat offset)
{
  CGRect frame = rect;
  frame.origin.y = CGRectGetMidY(alignmentRect) - CGRectGetMidY(rect);
  frame.origin.y += offset;
  return CGRectIntegral(frame);
}

CGRect SPXRectConstrainedToRect(CGRect rect, CGRect constrainToRect, UIEdgeInsets edgeInsets)
{
  CGRect constrainedRect = rect;
  
  constrainedRect.origin.x = MAX(CGRectGetMinX(constrainToRect) + edgeInsets.left, CGRectGetMinX(rect));
  constrainedRect.origin.y = MAX(CGRectGetMinY(constrainToRect) + edgeInsets.top, CGRectGetMinY(rect));
  constrainedRect.origin.x = MIN(CGRectGetMaxX(constrainToRect) - CGRectGetWidth(rect) - edgeInsets.right, CGRectGetMinX(constrainToRect) + CGRectGetMinX(rect));
  constrainedRect.origin.y = MIN(CGRectGetMaxY(constrainToRect) - CGRectGetHeight(rect) - edgeInsets.bottom, CGRectGetMinY(constrainToRect) + CGRectGetMinY(rect));
  
  return CGRectIntegral(constrainedRect);
}

void stroke1PxLine(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color, BOOL dashed)
{
  CGContextSaveGState(context);
  
  if (dashed) {
    CGFloat lineDash[6] = { 3, 3 };
    CGContextSetLineDash(context, 0.0, lineDash, 6);
  }
  
  CGContextSetLineCap(context, kCGLineCapRound);
  CGContextSetStrokeColorWithColor(context, color);
  CGContextSetLineWidth(context, 1.0);
  CGContextMoveToPoint(context, startPoint.x + 0.5f, startPoint.y + 0.5f);
  CGContextAddLineToPoint(context, endPoint.x + 0.5f, endPoint.y + 0.5f);
  CGContextStrokePath(context);
  CGContextRestoreGState(context);
}

void stroke1PxRect(CGContextRef context, CGRect rect, CGColorRef color, BOOL dashed)
{
  rect = CGRectMake(rect.origin.x + 0.5f, rect.origin.y + 0.5f, rect.size.width - 1, rect.size.height - 1);
  
  CGContextSaveGState(context);
  
  if (dashed) {
    CGFloat lineDash[2] = { 10, 5 };
    CGContextSetLineDash(context, 0.0, lineDash, 2);
  }
  
  CGContextSetLineCap(context, kCGLineCapSquare);
  CGContextSetLineWidth(context, 1.0);
  CGContextSetStrokeColorWithColor(context, color);
  CGContextStrokeRect(context, rect);
  CGContextRestoreGState(context);
}

