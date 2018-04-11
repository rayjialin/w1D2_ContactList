//
//  ContactList.h
//  ContactList
//
//  Created by ruijia lin on 4/10/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
@interface ContactList : NSObject

@property NSMutableArray *contactList;

-(void)addContact:(Contact *)newContact;

-(void)listContact;

- (void)showContact:(NSInteger)showIndexAt;

- (void)findContact:(NSString *)searchTerm;

@end
