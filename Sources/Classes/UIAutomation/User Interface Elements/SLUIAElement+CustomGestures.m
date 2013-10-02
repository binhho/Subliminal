//
//  SLUIAElement+CustomGestures.m
//  Subliminal
//
//  Created by Jeffrey Wear on 10/4/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLUIAElement+CustomGestures.h"

#import "SLGesture.h"
#import "SLTerminal.h"

@interface SLAppliedGesture : NSObject

- (instancetype)initWithGesture:(SLGesture *)gesture andReferenceFrame:(CGRect)frame;

- (NSString *)UIARepresentation;

@end

@implementation SLUIAElement (CustomGestures)

- (void)gesture:(SLGesture *)gesture {
    SLAppliedGesture *appliedGesture = [[SLAppliedGesture alloc] initWithGesture:gesture andReferenceFrame:[self rect]];
    [[SLTerminal sharedTerminal] evalWithFormat:@"UIATarget.localTarget().touch(%@);", [appliedGesture UIARepresentation]];
}

@end


#pragma mark -

@interface SLTouchState (UIAutomation)

- (NSString *)UIARepresentation;

@end

@implementation SLTouchState (UIAutomation)

- (NSString *)UIARepresentation {
    NSString *touchRepresentations = [[[self.touches valueForKey:@"UIARepresentation"] allObjects] componentsJoinedByString:@", "];
    return [NSString stringWithFormat:@"{time:%g, touch:[%@]}", self.time, touchRepresentations];
}

@end

@interface SLTouch (UIAutomation)

- (NSString *)UIARepresentation;

@end

@implementation SLTouch (UIAutomation)

- (NSString *)UIARepresentation {
    return [NSString stringWithFormat:@"{x:%g, y:%g}", self.location.x, self.location.y];
}

@end

@interface SLAbsoluteTouch : SLTouch

+ (instancetype)touchAtPoint:(CGPoint)point;

@end

@implementation SLAbsoluteTouch

+ (instancetype)touchAtPoint:(CGPoint)point {
    SLAbsoluteTouch *touch = [[self alloc] init];
    touch->_location = point;
    return touch;
}

@end


@implementation SLAppliedGesture {
    NSMutableArray *_states;
}

- (instancetype)initWithGesture:(SLGesture *)gesture andReferenceFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        _states = [[NSMutableArray alloc] initWithCapacity:[gesture.states count]];
        for (SLTouchState *state in gesture.states) {
            NSMutableSet *touches = [[NSMutableSet alloc] initWithCapacity:[state.touches count]];
            for (SLRelativeTouch *touch in state.touches) {
                CGPoint point = SLTouchPointFromOffsetRelativeToFrame(touch.location, frame);
                [touches addObject:[SLAbsoluteTouch touchAtPoint:point]];
            }
            [_states addObject:[SLTouchState stateAtTime:state.time withTouches:touches]];
        }
    }
    return self;
}

- (NSString *)UIARepresentation {
    NSString *stateRepresentations = [[_states valueForKey:@"UIARepresentation"] componentsJoinedByString:@", "];
    return [NSString stringWithFormat:@"[%@]", stateRepresentations];
}

@end
