//
//  SLEditingMenuTest.m
//  Subliminal
//
//  Created by Jeffrey Wear on 10/11/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface SLEditingMenuTest : SLIntegrationTest

@end

@implementation SLEditingMenuTest {
    SLElement *_testText, *_otherText;
    NSString *_menuItemTitle;
}

+ (NSString *)testCaseViewControllerClassName {
    return @"SLEditingMenuTestViewController";
}

- (void)setUpTest {
    [super setUpTest];

    _testText = [SLElement elementMatching:^BOOL(NSObject *obj) {
        return [obj.accessibilityLabel hasPrefix:@"A corner of the pub"];
    } withDescription:@"text element"];
    _otherText = [SLElement elementWithAccessibilityLabel:@"Inklings"];

    _menuItemTitle = @"Copy";
}

- (void)setUpTestCaseWithSelector:(SEL)testCaseSelector {
    [super setUpTestCaseWithSelector:testCaseSelector];

    SLAssertTrueWithTimeout(SLAskAppYesNo(webViewDidFinishLoad), 5.0, @"Webview did not load test HTML.");

    if (testCaseSelector == @selector(testTapCustomMenuItem)) {
        // It's important that this item have the same title as a standard item
        // (see the implementation of `-[SLEditingMenuItem itemWithAccessibilityLabel:]`)
        SLAskApp1(installCustomMenuItemWithTitle:, _menuItemTitle);
    }
}

- (void)tearDownTestCaseWithSelector:(SEL)testCaseSelector {
    // we never need to hide the editing menu because view controllers are not reused between tests
    // the view controller will automatically restore the standard menu items, too

    [super tearDownTestCaseWithSelector:testCaseSelector];
}

- (void)showEditingMenu {
    [UIAElement(_testText) touchAndHoldWithDuration:1.0];

    // wait for editing menu to appear before proceeding
    [self wait:1.0];
}

- (void)testCanMatchEditingMenu {
    SLEditingMenu *menu = [SLEditingMenu menu];
    SLAssertFalse([UIAElement(menu) isValidAndVisible], @"The editing menu should not be visible.");

    [self showEditingMenu];

    SLAssertTrue([UIAElement(menu) isVisible], @"The editing menu should be visible.");
}

- (void)testTapMenuItem {
    [self showEditingMenu];

    SLEditingMenuItem *menuItem = [SLEditingMenuItem itemWithAccessibilityLabel:_menuItemTitle];
    SLAssertTrue([UIAElement(menuItem) isVisible], nil);
    SLAssertNoThrow([UIAElement(menuItem) tap], nil);

    // give a little bit of time for the responder to perform the menu item action to be received
    SLAssertTrueWithTimeout(SLAskAppYesNo(menuItemWasTapped), 0.2, @"The menu item should have been tapped.");
}

// Something of an internal test--see the implementation of `-[SLEditingMenuItem itemWithAccessibilityLabel:]`.
// It's important that the custom item have the same label as a standard item.
- (void)testTapCustomMenuItem {
    SLAssertNoThrow([self testTapMenuItem], @"Tapping the custom menu item did not work as expected.");
}

@end
