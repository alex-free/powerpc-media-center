if COND_TOC2MP3
MAYBE_TOC2MP3 = toc2mp3
else
MAYBE_TOC2MP3 = 
endif

bin_PROGRAMS = toc2cue cue2toc toc2cddb $(MAYBE_TOC2MP3)

toc2cddb_SOURCES = toc2cddb.cc
toc2cue_SOURCES = toc2cue.cc
cue2toc_SOURCES = main.c cue2toc.c cue2toc.h timecode.c timecode.h
toc2mp3_SOURCES = toc2mp3.cc

toc2cddb_LDADD = -L$(top_builddir)/trackdb -ltrackdb
toc2cue_LDADD = -L$(top_builddir)/trackdb -ltrackdb
toc2mp3_LDADD = -L$(top_builddir)/trackdb -ltrackdb @LAME_LIBS@

if COND_MP3
toc2cddb_LDADD += @MAD_LIBS@
toc2cue_LDADD += @MAD_LIBS@
toc2mp3_LDADD += @MAD_LIBS@
endif

if COND_OGG
toc2cddb_LDADD += @VORBISFILE_LIBS@
toc2cue_LDADD += @VORBISFILE_LIBS@
toc2mp3_LDADD += @VORBISFILE_LIBS@
endif

toc2cddb_LDADD += @AO_LIBS@
toc2cue_LDADD += @AO_LIBS@
toc2mp3_LDADD += @AO_LIBS@

toc2mp3_CXXFLAGS = @LAME_CFLAGS@

INCLUDES = -I$(top_builddir)/trackdb

man1_MANS = cue2toc.1
EXTRA_DIST = $(man1_MANS)
