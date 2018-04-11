//
//  ContactList.m
//  ContactList
//
//  Created by ruijia lin on 4/10/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ContactList.h"
#import "InputCollector.h"

@implementation ContactList

//
- (instancetype)init
{
    self = [super init];
    if (self) {
        _contactList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addContact:(Contact *)newContact{
    
    for (Contact *contact in _contactList){
        if (contact.email == newContact.email){
            NSLog(@"\nEmail already exists, please create your account with another email.");
            return;
        }
    }
    
    [_contactList addObject:newContact];
}

- (void)listContact{
    for (Contact *contact in _contactList) {
        NSLog(@"%lu: %@", [_contactList indexOfObject:contact], contact.fullname);
    }
}

- (void) showContact: (NSInteger)showIndexAt{
//    InputCollector *showContactDetail = [[InputCollector alloc] init];
//    NSInteger contactIndex = [[showContactDetail inputForPrompt:@"Enter contact index to show the contact details"] integerValue];
    if (_contactList.count > 0 && showIndexAt <= _contactList.count){
        NSLog(@"\nfull name: %@", [[_contactList objectAtIndex:showIndexAt] fullname]);
        NSLog(@"\nfull name: %@", [[_contactList objectAtIndex:showIndexAt] email]);
        NSLog(@"\n%@: %@", [[_contactList objectAtIndex:showIndexAt] phoneType], [[_contactList objectAtIndex:showIndexAt] phoneNumber]);
    }else{
        NSLog(@"\nNot Found");
    }
}

- (void)findContact:(NSString *)searchTerm{
    NSLog(@"Following contacts were found:\n");
    for (Contact *contact in _contactList){
        if ([contact.fullname containsString:searchTerm] || [contact.email containsString:searchTerm]){
            NSLog(@"\nfull name: %@\n", contact.fullname);
            NSLog(@"\nemail: %@\n", contact.email);
        }
    }
}

@end
