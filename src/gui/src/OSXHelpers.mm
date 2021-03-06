/*
 * synergy -- mouse and keyboard sharing utility
 * Copyright (C) 2015 Synergy Si Ltd.
 *
 * This package is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * found in the file LICENSE that should have accompanied this file.
 *
 * This package is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "OSXHelpers.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <Cocoa/Cocoa.h>

bool
isOSXInterfaceStyleDark()
{
   // Implementation from http://stackoverflow.com/a/26472651
   NSDictionary* dict = [[NSUserDefaults standardUserDefaults] persistentDomainForName:NSGlobalDomain];
   id style = [dict objectForKey:@"AppleInterfaceStyle"];
   return (style && [style isKindOfClass:[NSString class]] && NSOrderedSame == [style caseInsensitiveCompare:@"dark"]);
}

bool
isOSXUseDarkIcons()
{
   if (@available(macOS 11, *)) {
      return true;
   }
   else {
      return isOSXInterfaceStyleDark();
   }
}
