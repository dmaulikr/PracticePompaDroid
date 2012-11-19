//
//  ActionSprite.m
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ActionSprite.h"


@implementation ActionSprite

-(void)idle {
  if (_actionState != kActionStateIdle) {
    [self stopAllActions];
    [self runAction:_idleAction];
    _actionState = kActionStateIdle;
    _velocity = CGPointZero;
  }
}

-(void)attack {
  if (_actionState == kActionStateIdle ||
      _actionState == kActionStateAttack ||
      _actionState == kActionStateWalk) {
    [self stopAllActions];
    [self runAction:_attackAction];
    _actionState = kActionStateAttack;
  }
}

-(void)walkWithDirection:(CGPoint)direction {
  if (_actionState == kActionStateIdle) {
    [self stopAllActions];
    [self runAction:_walkAction];
    _actionState = kActionStateWalk;
  }
  if (_actionState == kActionStateWalk) {
    _velocity = ccp(direction.x * _walkSpeed, direction.y * _walkSpeed);
    if (_velocity.x >= 0) self.scaleX = 1.0;
    else self.scaleX = -1.0;
  }
}

-(void)update:(ccTime)dt {
  if (_actionState == kActionStateWalk) {
    _desiredPosition = ccpAdd(position_, ccpMult(_velocity, dt));
  }
}

@end
