//
//  HUDLayer.m
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HUDLayer.h"


@implementation HUDLayer

- (id)init {
  if ((self = [super init])) {
    _dPad = [SimpleDPad dPadWithFile:@"pd_dpad.png" radius:64];
    _dPad.position = ccp(64.0, 64.0);
    _dPad.opacity = 100;
    [self addChild:_dPad];

    [self layoutHealthBar];
    
    CCMenuItem *pauseItem = [CCMenuItemImage itemWithNormalImage:@"pause.png"
                                                     selectedImage:@"pause.png"
                                                            target:nil
                                                          selector:nil];
    
    CCMenuItem *playItem = [CCMenuItemImage itemWithNormalImage:@"play.png"
                                                      selectedImage:@"play.png"
                                                             target:nil
                                                           selector:nil];
    
    CCMenuItemToggle *toggleItem = [CCMenuItemToggle itemWithTarget:self
                                                           selector:@selector(toggleGameplay)
                                                              items:pauseItem, playItem, nil];
    
    CCMenu *menu = [CCMenu menuWithItems:toggleItem, nil];
    menu.position = ccp(SCREEN.width-35, 25);
    [self addChild:menu];
    _isPaused = NO;
  }
  return self;
}

- (void)updateHealthBar:(CGFloat)percentage {
  self.healthBar.percentage = percentage;
}

- (void)layoutHealthBar {
  self.healthBar = [CCProgressTimer progressWithSprite:
                    [CCSprite spriteWithFile:@"healthBar.png"]];
  self.healthBar.type = kCCProgressTimerTypeBar;
  self.healthBar.percentage = 100;
  self.healthBar.midpoint = ccp(0,0); // starts from left
  self.healthBar.barChangeRate = ccp(1,0); // grow only in the "x"-horizontal direction
  self.healthBar.position = ccp(55, SCREEN.height-25);
  [self addChild:self.healthBar];
  
  CCLabelTTF *hpLabel = [CCLabelTTF labelWithString:@"HP" fontName:@"Arial" fontSize:14];
  hpLabel.position = ccp(25, SCREEN.height-25);
  [self addChild:hpLabel];
}

- (void)toggleGameplay {
  _isPaused = !_isPaused;
  
  if(_isPaused) {
    [[CCDirector sharedDirector] pause];
  } else {
    [[CCDirector sharedDirector] resume];
  }
}

@end
