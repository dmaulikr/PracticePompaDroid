//
//  GameScene.m
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

-(id)init {
  if ((self = [super init])) {
    _gameLayer = [GameLayer node];
    [self addChild:_gameLayer z:0];
    _hudLayer = [HUDLayer node];
    [self addChild:_hudLayer z:1];
    _hudLayer.dPad.delegate = _gameLayer;
    _gameLayer.hud = _hudLayer;
    _gameLayer.hero.hud = _hudLayer;
  }
  return self;
}

@end
