//
//  InputCollector.m
//  ContactList
//
//  Created by ruijia lin on 4/10/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
    self = [super init];
    if (self) {
        _commandHistory = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString{
    
    NSLog(@"\n%@", promptString);
    
    char input[255];
    fgets(input, 255, stdin);
    
    NSString *command = [[NSString stringWithCString:input encoding: NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    [_commandHistory addObject:command];
    return command;
}

-(void)history{
    NSLog(@"\nLast 3 commands you have entered were the follwoing:");
    for (NSInteger index = _commandHistory.count - 3; index < _commandHistory.count; index++){
        NSLog(@"\n\t%@", [_commandHistory objectAtIndex:index]);
    }
}
@end
