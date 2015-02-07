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


/**
 *  Returns a CGRect based on `rect` that is constrained within the bounds of `constrainToRect`
 *
 *  @param rect            The rect to constrain
 *  @param constrainToRect The rect to use for constraints
 *  @param edgeInsets      Provides paddding constraints for the resulting rect (if required)
 *
 *  @return The resulting constrained rect. If `rect` is already inside `constrainToRect` it will return unchanged.
 */
CG_EXTERN CGRect SPXRectConstrainedToRect(CGRect rect, CGRect constrainToRect, UIEdgeInsets edgeInsets);


/**
 *  Aligns `rect` horizontally within `alignmentRect`
 *
 *  @param rect          The rect to align
 *  @param alignmentRect The rect to align to
 *  @param offset        An offset to allow adjustments after alignment (optional)
 *
 *  @return The aligned rect
 */
CG_EXTERN CGRect SPXRectCenterHorizontallyInRect(CGRect rect, CGRect alignmentRect, CGFloat offset);


/**
 *  Aligns `rect` vertically within `alignmentRect`
 *
 *  @param rect          The rect to align
 *  @param alignmentRect The rect to align to
 *  @param offset        An offset to allow adjustments after alignment (optional)
 *
 *  @return The aligned rect
 */
CG_EXTERN CGRect SPXRectCenterVerticallyInRect(CGRect rect, CGRect alignmentRect, CGFloat offset);


/**
 *  Aligns `rect` both vertically and horizontally within `alignmentRect`
 *
 *  @param rect          The rect to align
 *  @param alignmentRect The rect to align to
 *  @param offsets       Horizontal and vertical offsets to allow adjustments after alignment (optional)
 *
 *  @return The aligned rect
 */
CG_EXTERN CGRect SPXRectCenterInRect(CGRect rect, CGRect alignmentRect, UIOffset offsets);


/**
 *  Strokes a 1 px rect (accounting for sub-pixel alignment, guaranteeing a sharp line)
 *
 *  @param context The graphics context to draw into
 *  @param rect    The rect to draw
 *  @param color   The color for this rect
 *  @param dashed  If YES, draws a dashed line using { 10, 5 } as its setting. If NO, a solid line is drawn
 */
void stroke1PxRect(CGContextRef context, CGRect rect, CGColorRef color, BOOL dashed);


/**
 *  Strokes a 1 px line (accounting for sub-pixel alignment, guaranteeing a sharp line)
 *
 *  @param context    The graphics context to draw into
 *  @param startPoint The start point of this line
 *  @param endPoint   The end point of this line
 *  @param color      The color for this line
 *  @param dashed     If YES, draws a dashed line using { 10, 5 } as its setting. If NO, a solid line is drawn
 */
void stroke1PxLine(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color, BOOL dashed);


