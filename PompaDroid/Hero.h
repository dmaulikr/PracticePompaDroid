//
//  Hero.h
//  PompaDroid
//
//  Created by Vincent Bacalso on 11/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ActionSprite.h"
#import "HUDLayer.h"

@interface Hero : ActionSprite {
    
}

@property (nonatomic,weak) HUDLayer *hud;

@end
