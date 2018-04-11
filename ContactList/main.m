//
//  main.m
//  ContactList
//
//  Created by ruijia lin on 4/10/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL quitContactList = YES;
        BOOL isPhoneNumberEntering = YES;
        NSString *quit = @"quit";
        InputCollector *input = [[InputCollector alloc] init];
        ContactList *contactList = [[ContactList alloc] init];
        
        [input inputForPrompt:@"Enter your username:"];
        
        while (quitContactList){
            
           NSString *commandPicker = [input inputForPrompt:@"Select from the following command to proceed:\n\tnew - create new contact\n\tlist - list contact\n\tshow - show contact\n\tfind - find contact\n\tquit - exit the program\n"];
            
            // Quit Command
            if ([commandPicker isEqualToString:quit]){         // Quit Command
                NSLog(@"\nHave a nice day:)");
                quitContactList = NO;
                continue;
                
                
            }else if ([commandPicker isEqualToString:@"new"]){        // New Contact Command
                Contact *contact = [[Contact alloc]init];
                contact.fullname = [input inputForPrompt:@"Enter your full name:"];
                contact.email = [input inputForPrompt:@"Enter your email:"];
                
                while (isPhoneNumberEntering){
                contact.phoneType = [input inputForPrompt:@"Enter your phone type:"];
                contact.phoneNumber = [input inputForPrompt:@"Enter your phone number:"];
                NSString *finishedPhoneNumber = [input inputForPrompt:@"Still entering phone number?"];
                    if ([finishedPhoneNumber isEqualToString:@"no"]){
                        isPhoneNumberEntering = NO;
                    }
                }
                    
                [contactList addContact:contact];
 
                
                
            }else if ([commandPicker isEqualToString:@"list"]){        // List Contact Command
                [contactList listContact];
                
                
                
            }else if ([commandPicker length] >= 4 && [[commandPicker substringToIndex:4] isEqualToString:@"show"]){        // Show Contact Command
                NSInteger showIndexAt = [[commandPicker stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"show"]] integerValue];
                [contactList showContact: showIndexAt];
                
                
                
            }else if ([commandPicker length] >= 4 && [[commandPicker substringToIndex:4] isEqualToString:@"find"]){   // Find Contact
                NSString *searchTerm = [[commandPicker substringFromIndex:4] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                [contactList findContact:searchTerm];
            }
            
            else if ([commandPicker isEqualToString:@"history"]){
                [input history]; // this is not completed implemented, currently other input other than command are also stored in the history array.
            }
            
            
        }
        return 0;
    }
}
