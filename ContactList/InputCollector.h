//
//  InputCollector.h
//  ContactList
//
//  Created by ruijia lin on 4/10/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

@property NSMutableArray *commandHistory;

- (NSString *)inputForPrompt:(NSString *)promptString;

- (void)history;
@end
