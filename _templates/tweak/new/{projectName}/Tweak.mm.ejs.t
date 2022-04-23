---
to: <%= projectName %>/<%= projectName %>/Tweak.mm
---
#import <Foundation/Foundation.h>
#import <substrate.h>
#import <CaptainHook/CaptainHook.h>
#import <mach-o/dyld.h>
#import <dlfcn.h>

MSInitialize {
    NSLog(@"<%= projectName %> Tweak loaded!");
};