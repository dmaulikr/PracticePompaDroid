//
//  HUDLayer.h
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleDPad.h"

@interface HUDLayer : CCLayer {
    
}

// add after the closing curly bracket but before the @end
@property (nonatomic,weak)SimpleDPad *dPad;
@property (nonatomic,strong) CCProgressTimer *healthBar;
@property (nonatomic, readwrite) BOOL isPaused;

- (void)updateHealthBar:(CGFloat)percentage;

@end
