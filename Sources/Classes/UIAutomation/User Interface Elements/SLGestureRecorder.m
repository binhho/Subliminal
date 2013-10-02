//
//  SLGestureRecorder.m
//  Subliminal
//
//  Created by Jeffrey Wear on 10/3/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLGestureRecorder.h"

#import <UIKit/UIGestureRecognizerSubclass.h>

#import "SLGesture.h"

@interface SLGestureRecorderRecognizer : UIGestureRecognizer

@property (nonatomic, readonly, strong) SLGesture *gesture;

- (instancetype)initWithTarget:(id)target action:(SEL)action referenceFrame:(CGRect)frame;

@end


@interface SLGestureRecorder () <UIGestureRecognizerDelegate>
@end

@implementation SLGestureRecorder {
    SLGestureRecorderRecognizer *_gestureRecognizer;
    SLGestureHandler _handler;
}

- (instancetype)initWithReferenceFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        _gestureRecognizer = [[SLGestureRecorderRecognizer alloc] initWithTarget:self
                                                                          action:@selector(didRecognizeGesture:)
                                                                  referenceFrame:frame];
        _gestureRecognizer.delegate = self;
    }
    return self;
}

- (void)dealloc {
    [_gestureRecognizer.view removeGestureRecognizer:_gestureRecognizer];
}

- (void)startRecordingWithHandler:(SLGestureHandler)handler {
    NSAssert([NSThread isMainThread], @"Gesture recording must start on the main thread.");
    NSAssert(!_handler, @"%@ is already recording.", self);

    _handler = [handler copy];
    [[[UIApplication sharedApplication] keyWindow] addGestureRecognizer:_gestureRecognizer];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)didRecognizeGesture:(SLGestureRecorderRecognizer *)recognizer {
    _handler(recognizer.gesture);
}

@end


#pragma mark -

@interface SLRelativeTouch (Recording)

+ (instancetype)touchWithUITouch:(UITouch *)touch referenceFrame:(CGRect)frame;

@end

@interface SLTouchState (Recording)

+ (instancetype)stateAtTime:(NSTimeInterval)time withUITouches:(NSSet *)touches referenceFrame:(CGRect)frame;

@end

@implementation SLTouchState (Recording)

+ (instancetype)stateAtTime:(NSTimeInterval)time withUITouches:(NSSet *)touches referenceFrame:(CGRect)frame {
    NSMutableSet *slTouches = [[NSMutableSet alloc] initWithCapacity:[touches count]];
    for (UITouch *touch in touches) {
        [slTouches addObject:[SLRelativeTouch touchWithUITouch:touch referenceFrame:frame]];
    }
    return [self stateAtTime:time withTouches:slTouches];
}

@end

@implementation SLRelativeTouch (Recording)

+ (instancetype)touchWithUITouch:(UITouch *)touch referenceFrame:(CGRect)frame {
    CGPoint locationInWindow = [touch locationInView:nil];
    CGPoint locationInScreen = [touch.window convertPoint:locationInWindow toWindow:nil];
    CGPoint offset = SLTouchOffsetFromPointRelativeToFrame(locationInScreen, frame);
    return [self touchAtOffset:offset];
}

@end

@implementation SLGestureRecorderRecognizer {
    CGRect _referenceFrame;
    NSDate *_gestureStartDate;
    SLMutableGesture *_gesture;
}

- (instancetype)initWithTarget:(id)target action:(SEL)action referenceFrame:(CGRect)frame {
    self = [self initWithTarget:target action:action];
    if (self) {
        _referenceFrame = frame;
        [self reset];
    }
    return self;
}

- (void)reset {
    _gestureStartDate = nil;
    _gesture = [[SLMutableGesture alloc] init];
}

- (SLGesture *)gesture {
    return [_gesture copy];
}

- (void)recordTouches:(NSSet *)touches {
    NSDate *touchDate = [NSDate date];
    if (!_gestureStartDate) {
        _gestureStartDate = touchDate;
    }
    NSTimeInterval touchTime = [touchDate timeIntervalSinceDate:_gestureStartDate];
    [_gesture addState:[SLTouchState stateAtTime:touchTime withUITouches:touches referenceFrame:_referenceFrame]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self recordTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self recordTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self recordTouches:touches];

    self.state = UIGestureRecognizerStateRecognized;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.state = UIGestureRecognizerStateCancelled;
}

@end
