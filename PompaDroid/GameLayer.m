//
//  GameLayer.m
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"

@implementation GameLayer

-(id)init {
  if ((self = [super init])) {
    [self initTileMap];
    [self scheduleUpdate];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"pd_sprites.plist"];
    _actors = [CCSpriteBatchNode batchNodeWithFile:@"pd_sprites.pvr.ccz"];
    [_actors.texture setAliasTexParameters];
    [self addChild:_actors z:-5];
    [self initHero];
    self.isTouchEnabled = YES;
  }
  return self;
}

-(void)dealloc {
  [self unscheduleUpdate];
}

-(void)initTileMap {
  _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"pd_tilemap.tmx"];
  for (CCTMXLayer *child in [_tileMap children]) {
    [[child texture] setAliasTexParameters];
  }
  [self addChild:_tileMap z:-6];
}

-(void)initHero {
  _hero = [Hero node];
  [_actors addChild:_hero];
  _hero.position = ccp(_hero.centerToSides, 80);
  _hero.desiredPosition = _hero.position;
  [_hero idle];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [_hero attack];
}

-(void)simpleDPad:(SimpleDPad *)simpleDPad didChangeDirectionTo:(CGPoint)direction {
  [_hero walkWithDirection:direction];
}

-(void)simpleDPadTouchEnded:(SimpleDPad *)simpleDPad {
  if (_hero.actionState == kActionStateWalk) {
    [_hero idle];
  }
}

-(void)simpleDPad:(SimpleDPad *)simpleDPad isHoldingDirection:(CGPoint)direction {
  [_hero walkWithDirection:direction];
}

-(void)update:(ccTime)dt {
  [_hero update:dt];
  [self updatePositions];
  [self setViewpointCenter:_hero.position];
}

-(void)updatePositions {
  float posX = MIN(_tileMap.mapSize.width * _tileMap.tileSize.width - _hero.centerToSides, MAX(_hero.centerToSides, _hero.desiredPosition.x));
  float posY = MIN(3 * _tileMap.tileSize.height + _hero.centerToBottom, MAX(_hero.centerToBottom, _hero.desiredPosition.y));
  _hero.position = ccp(posX, posY);
}

-(void)setViewpointCenter:(CGPoint) position {
  
  CGSize winSize = [[CCDirector sharedDirector] winSize];
  
  int x = MAX(position.x, winSize.width / 2);
  int y = MAX(position.y, winSize.height / 2);
  x = MIN(x, (_tileMap.mapSize.width * _tileMap.tileSize.width)
          - winSize.width / 2);
  y = MIN(y, (_tileMap.mapSize.height * _tileMap.tileSize.height)
          - winSize.height/2);
  CGPoint actualPosition = ccp(x, y);
  
  CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
  CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
  self.position = viewPoint;
}

@end
