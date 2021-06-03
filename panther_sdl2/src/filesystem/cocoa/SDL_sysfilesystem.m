/*
  Simple DirectMedia Layer
  Copyright (C) 1997-2014 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/
#include "../../SDL_internal.h"

#ifdef SDL_FILESYSTEM_COCOA

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* System dependent filesystem routines                                */

#if defined(__ALTIVEC__) && !defined(MAC_OS_X_VERSION_10_5)
/* to cricumvent a bug in Mac OS X 10.4 SDK */
#define vector __vector
#include <CoreServices/CoreServices.h>
#undef vector
#endif
#include <Foundation/Foundation.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "SDL_error.h"
#include "SDL_stdinc.h"
#include "SDL_filesystem.h"

char *
SDL_GetBasePath(void)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSBundle *bundle = [NSBundle mainBundle];
    const char* baseType = [[[bundle infoDictionary] objectForKey:@"SDL_FILESYSTEM_BASE_DIR_TYPE"] UTF8String];
    const char *base = NULL;
    char *retval = NULL;
    if (baseType == NULL) {
        baseType = "resource";
    }
    if (SDL_strcasecmp(baseType, "bundle")==0) {
        base = [[bundle bundlePath] fileSystemRepresentation];
    } else if (SDL_strcasecmp(baseType, "parent")==0) {
        base = [[[bundle bundlePath] stringByDeletingLastPathComponent] fileSystemRepresentation];
    } else {
        /* this returns the exedir for non-bundled  and the resourceDir for bundled apps */
        base = [[bundle resourcePath] fileSystemRepresentation];
    }
    if (base) {
        const size_t len = SDL_strlen(base) + 2;
        retval = (char *) SDL_malloc(len);
        if (retval == NULL) {
            SDL_OutOfMemory();
        } else {
            SDL_snprintf(retval, len, "%s/", base);
        }
    }

    [pool release];
    return retval;
}

char *
SDL_GetPrefPath(const char *org, const char *app)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    char *retval = NULL;

    if ([array count] > 0) {  /* we only want the first item in the list. */
        NSString *str = [array objectAtIndex:0];
        const char *base = [str fileSystemRepresentation];
        if (base) {
            const size_t len = SDL_strlen(base) + SDL_strlen(org) + SDL_strlen(app) + 4;
            retval = (char *) SDL_malloc(len);
            if (retval == NULL) {
                SDL_OutOfMemory();
            } else {
                char *ptr;
                SDL_snprintf(retval, len, "%s/%s/%s/", base, org, app);
                for (ptr = retval+1; *ptr; ptr++) {
                    if (*ptr == '/') {
                        *ptr = '\0';
                        mkdir(retval, 0700);
                        *ptr = '/';
                    }
                }
                mkdir(retval, 0700);
            }
        }
    }

    [pool release];
    return retval;
}

#endif /* SDL_FILESYSTEM_COCOA */

/* vi: set ts=4 sw=4 expandtab: */