//
//  Hero.m
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Hero.h"


@implementation Hero

-(id)init {
  if ((self = [super initWithSpriteFrameName:@"hero_idle_00.png"])) {
    int i;
    
    //idle animation
    CCArray *idleFrames = [CCArray arrayWithCapacity:6];
    for (i = 0; i < 6; i++) {
      CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                              spriteFrameByName:[NSString stringWithFormat:@"hero_idle_%02d.png", i]];
      [idleFrames addObject:frame];
    }
    CCAnimation *idleAnimation = [CCAnimation animationWithSpriteFrames:[idleFrames getNSArray] delay:1.0/12.0];
    self.idleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:idleAnimation]];
    
    self.centerToBottom = 39.0;
    self.centerToSides = 29.0;
    self.hitPoints = 100.0;
    self.damage = 20.0;
    self.walkSpeed = 80;
    
    CCArray *attackFrames = [CCArray arrayWithCapacity:3];
    for (i = 0; i < 3; i++) {
      CCSpriteFrame *frame =
      [[CCSpriteFrameCache sharedSpriteFrameCache]
       spriteFrameByName:[NSString stringWithFormat:@"hero_attack_00_%02d.png", i]];
      [attackFrames addObject:frame];
    }
    CCAnimation *attackAnimation =
    [CCAnimation animationWithSpriteFrames:[attackFrames getNSArray] delay:1.0/24.0];
    self.attackAction =
    [CCSequence actions:[CCAnimate actionWithAnimation:attackAnimation],
     [CCCallFunc actionWithTarget:self selector:@selector(idle)], nil];
    
    CCArray *walkFrames = [CCArray arrayWithCapacity:8];
    for (i = 0; i < 8; i++) {
      CCSpriteFrame *frame =
      [[CCSpriteFrameCache sharedSpriteFrameCache]
       spriteFrameByName:[NSString stringWithFormat:@"hero_walk_%02d.png", i]];
      [walkFrames addObject:frame];
    }
    CCAnimation *walkAnimation = [CCAnimation animationWithSpriteFrames:[walkFrames getNSArray] delay:1.0/12.0];
    self.walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnimation]];
  }
  return self;
}

@end