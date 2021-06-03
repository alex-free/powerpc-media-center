//==================================================================//
/*
    AtomicParsley - AP_NSFile_utils.mm

    AtomicParsley is GPL software; you can freely distribute, 
    redistribute, modify & use under the terms of the GNU General
    Public License; either version 2 or its successor.

    AtomicParsley is distributed under the GPL "AS IS", without
    any warranty; without the implied warranty of merchantability
    or fitness for either an expressed or implied particular purpose.

    Please see the included GNU General Public License (GPL) for 
    your rights and further details; see the file COPYING. If you
    cannot, write to the Free Software Foundation, 59 Temple Place
    Suite 330, Boston, MA 02111-1307, USA.  Or www.fsf.org

    Copyright ©2006 puck_lock
                                                                   */
//==================================================================//

#import <Cocoa/Cocoa.h>
//#include <Carbon/Carbon.h>
#include "AP_commons.h"
#include "AtomicParsley.h"

/*
char* APar_4CC_CreatorCodeCARBON(const char* filepath, const char* new_creator_code) {
	
	//FSpGetFInfo() is deprecated on 10.4, but this doesn't  work anyway, so onto Cocoa
	//update: maybe it was working but I used FileBuddy - and didn't notice how conveniently it added the T/C codes when they weren't there, so that is the source of my troubles.

	FSRef file_system_ref;
	FSCatalogInfo catalogInfo;
	FileInfo* finder_file_nfo = NULL;
  OSStatus status = noErr;
	OSErr err = noErr;
	FourCharCode filetypeCode, creatorCode;
	
	status = FSPathMakeRef( (const UInt8 *)filepath, &file_system_ref, false);
	if (status == noErr) {
		err = FSGetCatalogInfo (&file_system_ref, kFSCatInfoFinderInfo, &catalogInfo, NULL, NULL, NULL);
	} else {
		fprintf(stderr, "FSGetCatalogInfo error %d\n", (int)err);
	}
	
	finder_file_nfo = (FileInfo*) &catalogInfo.finderInfo;
	
	filetypeCode = ((FileInfo*)&catalogInfo.finderInfo)->fileType;
	if (filetypeCode != (OSType)0x00000000) {
    printf("Type: '%s'\n", (char*)&filetypeCode);
  } else {
    printf("No Type code found!\n");
	}

	return NULL;
}
*/


//TODO: there is a problem with this code seen in: "5.1channel audio-orig.mp4"
//it makes no difference what the file contains, iTunes won't see any (ANY) metadata if its hook/'M4A '.
//in fact, iTunes won't play the file at all
//changing the exact file (with all kinds of metadata) to TVOD/mpg4 - iTunes can play it fine, but doesn't fetch any metadata
//
//it might be beneficial to eval for channels and if its audio only & multichannel to NOT change the TYPE/creator codes

uint32_t APar_4CC_CreatorCode(const char* filepath, uint32_t new_type_code) {
	uint32_t return_value = 0;
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSString *inFile = [NSString stringWithUTF8String: filepath];
	
	if (new_type_code) {
		NSNumber* creator_code = [NSNumber numberWithUnsignedLong:'hook'];
		NSNumber* type_code = [NSNumber numberWithUnsignedLong:new_type_code];
		NSDictionary* output_attributes = [NSDictionary dictionaryWithObjectsAndKeys:creator_code, NSFileHFSCreatorCode, 
																																							type_code, NSFileHFSTypeCode, nil];
		
		if (![[NSFileManager defaultManager] changeFileAttributes:output_attributes atPath:inFile]) {
			NSLog(@" AtomicParsley error: setting type and creator code on %@", inFile);
		}																																					
				
	} else {
		NSDictionary* file_attributes = [[NSFileManager defaultManager] fileAttributesAtPath:inFile traverseLink:YES];
		return_value = [[file_attributes objectForKey:NSFileHFSTypeCode] unsignedLongValue ];
		
		//NSLog(@"code: %@\n", [file_attributes objectForKey:NSFileHFSTypeCode] );
	}
		
	[pool release];
	
	return return_value;
}

//there is a scenario that is as of now unsupported (or botched, depending if you use the feature), although it would be easy to implement. To make a file bookmarkable, the TYPE code is set to 'M4B ' - which can be *also* done by changing the extension to ".m4b". However, due to the way that the file is tested here, a ".mp4" with 'M4B ' type code will get changed into a normal audio file (not-bookmarkable).

void APar_SupplySelectiveTypeCreatorCodes(const char *inputPath, const char *outputPath, uint8_t forced_type_code) {
	if (forced_type_code != NO_TYPE_FORCING) {
		if (forced_type_code == FORCE_M4B_TYPE) {
			APar_4CC_CreatorCode(outputPath, 'M4B ');
		}
		return;
	}
	
	char* input_suffix = strrchr(inputPath, '.');
	//user-defined output paths may have the original file as ".m4a" & show up fine when output to ".m4a"
	//output to ".mp4" and it becomes a generic (sans TYPE/CREATOR) file that defaults to Quicktime Player
	char* output_suffix = strrchr(outputPath, '.');
	
	char* typecode = (char*)malloc( sizeof(char)* 4 );
	memset(typecode, 0, sizeof(char)*4);
	
	uint32_t type_code = APar_4CC_CreatorCode(inputPath, 0);
	
	char4TOuint32(type_code, typecode);
	
	//fprintf(stdout, "%s - %s\n", typecode, input_suffix);
	APar_TestTracksForKind();
	
	if (strncasecmp(input_suffix, ".mp4", 4) == 0 || strncasecmp(output_suffix, ".mp4", 4) == 0) { //only work on the generic .mp4 extension
		if (track_codecs.has_avc1 || track_codecs.has_mp4v || track_codecs.has_drmi) {
			type_code = APar_4CC_CreatorCode(outputPath, 'M4V ');
			
		//for a podcast an audio track with either a text, jpeg or url track is required, otherwise it will fall through to generic m4a;
		//files that are already .m4b or 'M4B ' don't even enter into this situation, so they are safe
		//if the file had video with subtitles (tx3g), then it would get taken care of above in the video section - unsupported by QT currently
		} else if (track_codecs.has_mp4a && (track_codecs.has_timed_text || track_codecs.has_timed_jpeg || track_codecs.has_timed_tx3g) ) {
			type_code = APar_4CC_CreatorCode(outputPath, 'M4B ');
			
		//default to audio; technically so would a drms iTMS drm audio file with ".mp4". But that would also mean it was renamed. They should be 'M4P '
		} else {
			type_code = APar_4CC_CreatorCode(outputPath, 'M4A ');
		}
	}
	
	return;
}
