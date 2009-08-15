//
//  AppController.m
//  aping
//
//  Created by Caius Durling on 28/07/2009.
//  Copyright 2009 Hentan Software. All rights reserved.
//

#import "AppController.h"

#define TOTAL_PINGS @"total_pings"

@interface AppController ()

- (void) processData:(NSData *)newData;
- (void) processLine: (NSString *)line;
- (void) outputStatsLine;
- (void) clearLastLine;
- (void) printLine: (NSString *)line;
- (void) printNewLine: (NSString *)line;
- (float) packetLoss;

@end


@implementation AppController

- (id) init
{
  self = [super init];

  totalPings = 0;
  totalLines = 0;
  countersStarted = NO;
  
  return self;
}

- (id) initWithAddress: (NSString*)newAddress
{
  self = [super init];
  
  // Setup the task
  task = [NSTask new];
  [task setLaunchPath: @"/sbin/ping"];
  
  NSArray *arguments;
  arguments = [NSArray arrayWithObjects: newAddress, nil];
  [task setArguments: arguments];
  
  NSPipe *outputPipe;
  outputPipe = [NSPipe pipe];
  [task setStandardOutput:outputPipe];
  
  outputFile = [outputPipe fileHandleForReading];

  return self;
}

- (void) dealloc
{
  [task release];
  [outputFile release];
  [super dealloc];
}

- (void) run
{
  NSData *data;

  [task launch];  
  
  while ((data = [outputFile availableData]) && [data length]) {
    [self processData:data];
  }
}

- (void) stop
{
  // ^C
  [task interrupt];

  // Print out the ping data
  NSData *data;
  data = [outputFile readDataToEndOfFile];
  [self printLine:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

#pragma mark Private Methods

- (void) processData: (NSData *)newData
{
  NSString *line, *data;
  data = [[NSString alloc] initWithData:newData encoding: NSUTF8StringEncoding];

  NSArray *lines = [data componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
  for (line in lines) {
    if ([line caseInsensitiveCompare:@""] == NSOrderedSame)
      continue;
    
//    NSLog(@"%s", _cmd);
    [self processLine:line];
  }

  [line release];
  [data release];
  [lines release];
}

- (void) processLine: (NSString *)line
{
  // Clear the last line if we printed a stats line out
  if (printedStatsLine) {
    [self clearLastLine];
    printedStatsLine = NO;
  }
  // Print out whatever we were given
  [self printNewLine:line];
  
  // Only count the line if we've started pinging
  if (countersStarted)
    totalLines++;

  // Start counting from the next line onwards if its
  // PING google.com (74.125.67.100): 56 data bytes
  if ([line isMatchedByRegex:@"^PING"]) {
    countersStarted = YES;
  }  

  // See if the line is a ping or not
  NSString *regex = @"\\d+ bytes from (.*?): icmp_seq=\\d+ ttl=\\d+ time=(\\d+\\.\\d+) ms";
  if ([line isMatchedByRegex:regex]) {
    // Only update if we're counting
    if (countersStarted)
      totalPings++;
    
    // Split the line into the bits we need
    // 0 - ip address
    // 1 - ms taken for the ping
    NSArray *lineParams = [line arrayOfCaptureComponentsMatchedByRegex:regex];
  }
  // And finally print out our stat line
  [self outputStatsLine];
}

// Clears the last line in the terminal
- (void) clearLastLine
{
  printf("\r\e[0k");
}

// Outputs a line of statistics, this is written
// out after every line, and should have -[AppController clearLastLine]
// called before it so there is only one line on screen at any one time.
- (void) outputStatsLine
{
  printedStatsLine = YES;
  NSString *line;
  line = [NSString stringWithFormat:@"%d sent, %d received, %.1f%% packet loss",
          totalLines,
          totalPings,
          [self packetLoss]
          ];
  [self printLine:line];
}

- (float) packetLoss
{
  // totalLines = 10
  // totalPings = 1
  
  return 100.0 - (((float)totalPings/(float)totalLines)*100.0);
  
  // packetLoss.should == 10.0
}

- (void) printLine: (NSString *)line
{
  printf("%s", [line UTF8String]);
  fflush(stdout);
}

- (void) printNewLine: (NSString *)line
{
  printf("%s\n", [line UTF8String]);
  fflush(stdout);
}

@end
