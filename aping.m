#import <Foundation/Foundation.h>
#import "AppController.h"
#import <signal.h>
#import <stdio.h>
#import <unistd.h>

void ex_program(int sig);
AppController *cmd;

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];  
  
  NSString *firstArgument;
  
  if (argc == 0 || argv[1] == NULL) {
    NSLog(@"`ping` requires at least one argument.");
    return 1;
  } else {
    firstArgument = [NSString stringWithFormat:@"%s", argv[1]];
//    NSLog(@"Arg 1: %@", firstArgument);
  }
  
  cmd = [[AppController alloc] initWithAddress:firstArgument];
  (void) signal(SIGINT, ex_program);
  [cmd run];
  
  [cmd release];
  [pool drain];
  return 0;
}

void ex_program(int sig) {
  [cmd stop];
//  printf("Wake up call ... !!! - Catched signal: %d ... !!\n", sig);
  
  // And finally exit
  exit(sig);
}

