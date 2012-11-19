//
//  GameScene.h
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "GameLayer.h"
#import "HUDLayer.h"

@interface GameScene : CCScene {
    
}

@property(nonatomic,weak)GameLayer *gameLayer;
@property(nonatomic,weak)HUDLayer *hudLayer;

@end
