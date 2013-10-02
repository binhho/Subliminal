//
//  SLGestureRecorder+SLUIAElement.m
//  Subliminal
//
//  Created by Jeffrey Wear on 10/4/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLGestureRecorder+SLUIAElement.h"

#import "SLGesture.h"
#import "SLUIAElement.h"

@implementation SLGestureRecorder (SLUIAElement)

+ (SLGesture *)recordGestureWithElement:(SLUIAElement *)element {
    NSAssert(![NSThread isMainThread], @"%s is only to be called from the background.", __PRETTY_FUNCTION__);

    dispatch_semaphore_t recordingSemaphore = dispatch_semaphore_create(0);

    SLGesture *__block recordedGesture = nil;
    SLGestureRecorder *recorder = [[self alloc] initWithReferenceFrame:[element rect]];
    dispatch_sync(dispatch_get_main_queue(), ^{
        [recorder startRecordingWithHandler:^(SLGesture *gesture) {
            recordedGesture = [gesture copy];
            dispatch_semaphore_signal(recordingSemaphore);
        }];
    });

    dispatch_semaphore_wait(recordingSemaphore, DISPATCH_TIME_FOREVER);
    dispatch_release(recordingSemaphore);
    
    return recordedGesture;
}

@end
