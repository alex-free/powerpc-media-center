//==================================================================//
/*
    AtomicParsley - AP_commons.h

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

    Copyright ?2006 puck_lock
																																		*/
//==================================================================//

#include <sys/types.h>
#include <sys/stat.h>

#ifndef _UINT8_T
#define _UINT8_T
typedef unsigned char         uint8_t;
#endif /*_UINT8_T */

#ifndef _UINT16_T
#define _UINT16_T
typedef unsigned short       uint16_t;
#endif /* _UINT16_T */

#ifndef _UINT32_T
#ifndef __uint32_t_defined
typedef unsigned int         uint32_t;
#endif
#endif /*_UINT32_T */

#ifndef _UINT64_T
#define _UINT64_T
#if defined (_MSC_VER)
typedef unsigned __int64	 uint64_t;
#else
typedef unsigned long long   uint64_t;
#endif /* _MSC_VER */
#endif /* _UINT64_T */

#ifndef _INT16_T
#define _INT16_T
typedef short       int16_t;
#endif /* _INT16_T */

#if defined (__ppc__) || defined (__ppc64__)
#define SWAP16(x) (x)
#define SWAP32(x) (x)
#else
#define SWAP16(x) ((((x)&0xFF)<<8) | (((x)>>8)&0xFF))
#define SWAP32(x) ((((x)&0xFF)<<24) | (((x)>>24)&0xFF) | (((x)&0x0000FF00)<<8) | (((x)&0x00FF0000)>>8) )
#endif

#if defined (_MSC_VER)
int fseeko(FILE *stream, uint64_t pos, int whence);
#endif

uint8_t APar_read8(FILE* m4afile, uint32_t pos);
uint16_t APar_read16(char* buffer, FILE* m4afile, uint32_t pos);
uint32_t APar_read32(char* buffer, FILE* m4afile, uint32_t pos);
void APar_readX(char* buffer, FILE* m4afile, uint32_t pos, uint32_t length);
uint32_t APar_FindValueInAtom(char* uint32_buffer, FILE* m4afile, short an_atom, uint32_t start_position, uint32_t eval_number);

void APar_UnpackLanguage(unsigned char lang_code[], uint16_t packed_language);
uint16_t PackLanguage(const char* language_code, uint8_t lang_offset);

#if defined (_MSC_VER)
int lroundf(float a);
#endif

#if ( defined (WIN32) && !defined (__CYGWIN__) && !defined (_LIBC) ) || defined (_MSC_VER)
char *strsep (char **stringp, const char *delim);
#endif

wchar_t* Convert_multibyteUTF16_to_wchar(char* input_unicode, size_t glyph_length, bool skip_BOM);
unsigned char* Convert_multibyteUTF16_to_UTF8(char* input_utf8, size_t glyph_length, size_t byte_count);
wchar_t* Convert_multibyteUTF8_to_wchar(const char* input_utf8);

uint16_t UInt16FromBigEndian(const char *string);
uint32_t UInt32FromBigEndian(const char *string);
uint64_t UInt64FromBigEndian(const char *string);
void char4TOuint32(uint32_t lnum, char* data);
void char8TOuint64(uint64_t ullnum, char* data);

uint32_t float_to_16x16bit_fixed_point(double floating_val);
double fixed_point_16x16bit_to_double(uint32_t fixed_point);

uint32_t widechar_len(char* instring, uint32_t _bytes_);

bool APar_assert(bool expression, int error_msg, char* supplemental_info);
