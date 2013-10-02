//
//  SLGesture.h
//  Subliminal
//
//  Created by Jeffrey Wear on 10/3/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class SLTouchState;
@interface SLGesture : NSObject <NSCoding, NSCopying, NSMutableCopying>

@property (nonatomic, strong, readonly) NSArray *states;

+ (instancetype)gestureWithStates:(NSArray *)states;

@end


@interface SLGesture (Serialization)

+ (instancetype)gestureWithContentsOfFile:(NSString *)path;

- (BOOL)writeToFile:(NSString *)path;

@end


@interface SLMutableGesture : SLGesture

- (void)addState:(SLTouchState *)state;

@end


#pragma mark -

@interface SLTouchState : NSObject <NSCoding>

@property (nonatomic, readonly) NSTimeInterval time;
@property (nonatomic, strong, readonly) NSSet *touches;

+ (instancetype)stateAtTime:(NSTimeInterval)time withTouches:(NSSet *)touches;

@end


@interface SLTouch : NSObject <NSCoding> {
    @protected
    CGPoint _location;
}

@property (nonatomic, readonly) CGPoint location;

@end


@interface SLRelativeTouch : SLTouch

+ (instancetype)touchAtOffset:(CGPoint)offset;

@end

extern CGPoint SLTouchOffsetFromPointRelativeToFrame(CGPoint point, CGRect frame);
extern CGPoint SLTouchPointFromOffsetRelativeToFrame(CGPoint offset, CGRect frame);
