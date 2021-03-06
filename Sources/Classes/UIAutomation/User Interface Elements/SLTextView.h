//
//  SLTextView.h
//  Subliminal
//
//  Created by Jeffrey Wear on 7/29/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLElement.h"

/**
 `SLTextView` matches instances of `UITextView`.
 */
@interface SLTextView : SLElement

/**
 The text displayed by the text field.
 
 @exception SLUIAElementInvalidException Raised by both `-text` and `-setText:`
 if the element is not valid by the end of the [default timeout](+defaultTimeout).

 @exception SLUIAElementNotTappableException Raised, only by `setText:`, if the
 element is not tappable when whatever amount of time remains of the default
 timeout after the element becomes valid elapses.
 */
@property (nonatomic, copy) NSString *text;

@end


/**
 SLWebTextView matches text views displayed in web views.

 Such as HTML `textarea` elements.

 #### Configuring web text views' accessibility information

 A web text view's `[-label](-[SLUIAElement label])` is the text of a `DOM`
 element specified by the "aria-labelled-by" attribute, if present.
 See `SLWebTextView.html` and the `SLWebTextView` test cases of `SLTextViewTest`.
 */
@interface SLWebTextView : SLElement

/**
 The text displayed by the text view.

 `-text` returns the web text view's value (i.e. the `value` of the text area).

 @exception SLUIAElementInvalidException Raised by both `-text` and `-setText:`
 if the element is not valid by the end of the [default timeout](+defaultTimeout).

 @exception SLUIAElementNotTappableException Raised, only by `-setText:`, if the
 element is not tappable when whatever amount of time remains of the default
 timeout after the element becomes valid elapses.
 */
@property (nonatomic, copy) NSString *text;

@end
