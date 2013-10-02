//
//  SLGestureRecorder+SLUIAElement.h
//  Subliminal
//
//  Created by Jeffrey Wear on 10/4/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLGestureRecorder.h"

@class SLGesture, SLUIAElement;
@interface SLGestureRecorder (SLUIAElement)

+ (SLGesture *)recordGestureWithElement:(SLUIAElement *)element;

@end
