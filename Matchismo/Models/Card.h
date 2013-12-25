//
//  Card.h
//  Matchismo
//
//  Created by sunil maganti on 12/24/13.
//  Copyright (c) 2013 sunil maganti. All rights reserved.
//

//#import <Foundation/Foundation.h>
@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property ( nonatomic, getter = isChosen) BOOL chosen;

@property ( nonatomic, getter = isMatched) BOOL matched;


- (int)match:(NSArray *) otherCards;

@end
