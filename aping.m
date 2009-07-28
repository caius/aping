#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];  
  
  NSString *firstArgument = [NSString stringWithFormat:@"%s", argv[1]];
  
  NSLog(@"Arg 1: %@", firstArgument);
  
  // Setup the task
  NSTask *task;
  task = [NSTask new];
  [task setLaunchPath: @"/sbin/ping"];
  
  NSArray *arguments;
  arguments = [NSArray arrayWithObjects: firstArgument, nil];
  [task setArguments: arguments];
  
  NSPipe *pipe;
  pipe = [NSPipe pipe];
  [task setStandardOutput: pipe];
  
  NSFileHandle *file;
  file = [pipe fileHandleForReading];
  
  [task launch];  
  
  
  NSData *data;
  NSString *string;

  while (data = [file availableData]) {
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    printf("\r\e[0k");
    printf("%s", [string UTF8String]);
    printf("Average stuff here");
    
    data = nil;
    string = nil;
  }
  
  [pool drain];
  return 0;
}
