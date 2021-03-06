/*  cdrdao - write audio CD-Rs in disc-at-once mode
 *
 *  Copyright (C) 1998-2001  Andreas Mueller <andreas@daneb.de>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#ifndef __SETTINGS_H__
#define __SETTINGS_H__

extern const char *SET_WRITE_SPEED;
extern const char *SET_WRITE_DRIVER;
extern const char *SET_WRITE_DEVICE;
extern const char *SET_WRITE_BUFFERS;
extern const char *SET_READ_SPEED;
extern const char *SET_USER_CAPACITY;
extern const char *SET_FULL_BURN;
extern const char *SET_READ_DRIVER;
extern const char *SET_READ_DEVICE;
extern const char *SET_READ_PARANOIA_MODE;
extern const char *SET_CDDB_SERVER_LIST;
extern const char *SET_CDDB_TIMEOUT;
extern const char *SET_CDDB_DB_DIR;
extern const char *SET_TMP_FILE_DIR;

class Settings {
public:
  Settings();
  ~Settings();

  int read(const char *);
  int write(const char *) const; 

  const int *getInteger(const char *) const;
  const char *getString(const char *) const;

  void set(const char *, int);
  void set(const char *, const char *);

private:
  class SettingsImpl *impl_;
};

#endif
