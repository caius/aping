//
//  AppController.h
//  aping
//
//  Created by Caius Durling on 28/07/2009.
//  Copyright 2009 Hentan Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
  NSTask *task;
  NSFileHandle *outputFile;
  
  int totalLines;
  int totalPings;
  BOOL countersStarted;
  BOOL printedStatsLine;  
}

- (id) initWithAddress: (NSString*)newAddress;
- (void) run;
- (void) stop;

@end
