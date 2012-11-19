//
//  HUDLayer.m
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HUDLayer.h"


@implementation HUDLayer

-(id)init {
  if ((self = [super init])) {
    _dPad = [SimpleDPad dPadWithFile:@"pd_dpad.png" radius:64];
    _dPad.position = ccp(64.0, 64.0);
    _dPad.opacity = 100;
    [self addChild:_dPad];
  }
  return self;
}

@end
