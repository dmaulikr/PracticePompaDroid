//
//  GameLayer.h
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Hero.h"
#import "HUDLayer.h"

@interface GameLayer : CCLayer <SimpleDPadDelegate>{
  CCTMXTiledMap *_tileMap;
  CCSpriteBatchNode *_actors;
  Hero *_hero;
}

@property (nonatomic,weak) HUDLayer *hud;

@end
