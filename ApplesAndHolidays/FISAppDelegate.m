//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */


-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *applePicker = [fruits filteredArrayUsingPredicate:applePredicate];

    return applePicker;
}



-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
   
    return [database[season] allKeys];
}


-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString*)season inDatabase:(NSDictionary*)database {
    NSMutableArray *supplies = database[season][holiday];
    return supplies;
}



-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    BOOL holidayInSeason = NO;
    
    NSArray *holidays = [database[season] allKeys];
    
    if ([holidays containsObject:holiday]){
        holidayInSeason = YES;
    }
    
    return holidayInSeason;
    
}



-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    return [database[season][holiday] containsObject:supply];
    
}


-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    database[season][holiday]= [[NSMutableArray alloc]init];
    NSLog(@"\n \n \n \n \n %@",database);
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];
    
    return database;
}
@end