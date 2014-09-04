#!/bin/sh

##############################################################################
####
#### Set Program Defaults
####
#### This script sets basic program defaults and disables most nag screens/popups
#### present in the software by modifying the user template in Mac OS X with PlistBuddy.
####
#### The script can be used across environments without modification and should be
#### run as a delayed script from DeployStudio.
####
#### Created: 6-20-2012 by Cody Eding (ceding@oaisd.org)
#### Last Modified: 9/3/2014 by Cody Eding (cody@codyeding.com)
####
##############################################################################

# Sets some variables to make writing the code a little easier.

USERPREFS_DIR="/System/Library/User Template/English.lproj/Library/Preferences"
PREFS_DIR="/Library/Preferences"

# Disables Adobe Flash Player update checks.

/bin/mkdir "/Library/Application Support/Macromedia/"
/bin/echo "AutoUpdateDisable=1" > "/Library/Application Support/Macromedia/mms.cfg"
/bin/echo "AVHardwareEnabledDomain=hol-sam" >> "/Library/Application Support/Macromedia/mms.cfg"

# Disables Adobe Acrobat 9.52 Self-Heal

/usr/libexec/PlistBuddy -c "Delete 'NoViewerSelfHealNeeded Jul 30 2012'" "${USERPREFS_DIR}/com.adobe.acrobat.90.sh.plist"
/usr/libexec/PlistBuddy -c "Add 'NoViewerSelfHealNeeded Jul 30 2012' bool TRUE" "${USERPREFS_DIR}/com.adobe.acrobat.90.sh.plist"

# Disables Adobe Reader update checks and EULA.

/usr/libexec/PlistBuddy -c "Delete 10:EULAAccepted" "${USERPREFS_DIR}/com.adobe.Reader.plist"
/usr/libexec/PlistBuddy -c "Add 10:EULAAccepted bool TRUE" "${USERPREFS_DIR}/com.adobe.Reader.plist"
/usr/libexec/PlistBuddy -c "Delete 10:AVGeneral:CheckForUpdatesAtStartup:1" "${USERPREFS_DIR}/com.adobe.Reader.plist"
/usr/libexec/PlistBuddy -c "Add 10:AVGeneral:CheckForUpdatesAtStartup array" "${USERPREFS_DIR}/com.adobe.Reader.plist"
/usr/libexec/PlistBuddy -c "Add 10:AVGeneral:CheckForUpdatesAtStartup:1" "${USERPREFS_DIR}/com.adobe.Reader.plist"
/usr/libexec/PlistBuddy -c "Add 10:AVGeneral:CheckForUpdatesAtStartup:1 integer 0" "${USERPREFS_DIR}/com.adobe.Reader.plist"
/usr/libexec/PlistBuddy -c "Add 10:AVGeneral:CheckForUpdatesAtStartup:1 bool FALSE" "${USERPREFS_DIR}/com.adobe.Reader.plist"

# Disables Flip4Mac update checks.

/usr/libexec/PlistBuddy -c "Delete PrefWindowTabIndex" "${USERPREFS_DIR}/net.telestream.wmv.plist"
/usr/libexec/PlistBuddy -c "Add PrefWindowTabIndex integer 3" "${USERPREFS_DIR}/net.telestream.wmv.plist"
/usr/libexec/PlistBuddy -c "Delete UpdateCheck_CheckInterval" "${USERPREFS_DIR}/net.telestream.wmv.plist"
/usr/libexec/PlistBuddy -c "Add UpdateCheck_CheckInterval integer 9999" "${USERPREFS_DIR}/net.telestream.wmv.plist"
/usr/libexec/PlistBuddy -c "Delete UpdateCheck_DateLastChecked" "${USERPREFS_DIR}/net.telestream.wmv.plist"
/usr/libexec/PlistBuddy -c "Add UpdateCheck_DateLastChecked string '2021-06-12 13:20:36 -0400'" "${USERPREFS_DIR}/net.telestream.wmv.plist"
/usr/libexec/PlistBuddy -c "Delete VersionCheck" "${USERPREFS_DIR}/net.telestream.wmv.plist"
/usr/libexec/PlistBuddy -c "Add VersionCheck integer 372304019" "${USERPREFS_DIR}/net.telestream.wmv.plist"

# Disables Microsoft Silverlight update checks.

/usr/libexec/PlistBuddy -c "Delete UpdateMode" "${USERPREFS_DIR}/com.microsoft.silverlight.plist"
/usr/libexec/PlistBuddy -c "Add UpdateMode integer 2" "${USERPREFS_DIR}/com.microsoft.silverlight.plist"

# Disables Perian update checks.

/usr/libexec/PlistBuddy -c "Delete LastInstalledVersion" "${USERPREFS_DIR}/org.perian.Perian.plist"
/usr/libexec/PlistBuddy -c "Add LastInstalledVersion string 1.2.3" "${USERPREFS_DIR}/org.perian.Perian.plist"
/usr/libexec/PlistBuddy -c "Delete NextRunDate" "${USERPREFS_DIR}/org.perian.Perian.plist"
/usr/libexec/PlistBuddy -c "Add NextRunDate date Sun Jan 01 11:00:00 EST 4001" "${USERPREFS_DIR}/org.perian.Perian.plist"

# Disables Jing update checks. (NOTE: Jing seems to overwrite these on first launch.)

/usr/libexec/PlistBuddy -c "Delete SUAutomaticallyUpdate" "${USERPREFS_DIR}/com.techSmith.jing.plist"
/usr/libexec/PlistBuddy -c "Add SUAutomaticallyUpdate bool FALSE" "${USERPREFS_DIR}/com.techSmith.jing.plist"
/usr/libexec/PlistBuddy -c "Delete SUEnableAutomaticChecks" "${USERPREFS_DIR}/com.techSmith.jing.plist"
/usr/libexec/PlistBuddy -c "Add SUEnableAutomaticChecks bool FALSE" "${USERPREFS_DIR}/com.techSmith.jing.plist"

# Disables Google Updater. Should work for Chrome, Picasa, Earth, etc.

/usr/libexec/PlistBuddy -c "Delete checkInterval" "${USERPREFS_DIR}/com.google.Keystone.Agent.plist"
/usr/libexec/PlistBuddy -c "Add checkInterval real 0" "${USERPREFS_DIR}/com.google.Keystone.Agent.plist"

# Disables Google Picasa EULA, logging, "features" popup and usage stats.

/usr/libexec/PlistBuddy -c "Delete showeula" "${USERPREFS_DIR}/com.google.picasa.plist"
/usr/libexec/PlistBuddy -c "Add showeula integer 0" "${USERPREFS_DIR}/com.google.picasa.plist"
/usr/libexec/PlistBuddy -c "Delete LogLevel" "${USERPREFS_DIR}/com.google.picasa.plist"
/usr/libexec/PlistBuddy -c "Add LogLevel integer 0" "${USERPREFS_DIR}/com.google.picasa.plist"
/usr/libexec/PlistBuddy -c "Delete usagestats" "${USERPREFS_DIR}/com.google.picasa.plist"
/usr/libexec/PlistBuddy -c "Add usagestats integer 0" "${USERPREFS_DIR}/com.google.picasa.plist"
/usr/libexec/PlistBuddy -c "Delete showfeatureslink" "${USERPREFS_DIR}/com.google.picasa.plist"
/usr/libexec/PlistBuddy -c "Add showfeatureslink integer 39" "${USERPREFS_DIR}/com.google.picasa.plist"

# Disables Google Earth first-run tips and ads.

/usr/libexec/PlistBuddy -c "Delete adsDisabled" "${USERPREFS_DIR}/com.google.GoogleEarthPlus.plist"
/usr/libexec/PlistBuddy -c "Add adsDisabled bool TRUE" "${USERPREFS_DIR}/com.google.GoogleEarthPlus.plist"
/usr/libexec/PlistBuddy -c "Delete enableTips" "${USERPREFS_DIR}/com.google.GoogleEarthPlus.plist"
/usr/libexec/PlistBuddy -c "Add enableTips bool FALSE" "${USERPREFS_DIR}/com.google.GoogleEarthPlus.plist"

# Disables Google SketchUp update notifications and welcome window.

/usr/libexec/PlistBuddy -c "Delete SketchUp.Preferences.CheckForUpdates" "${USERPREFS_DIR}/com.google.sketchupfree8.plist"
/usr/libexec/PlistBuddy -c "Add SketchUp.Preferences.CheckForUpdates string 'NO'" "${USERPREFS_DIR}/com.google.sketchupfree8.plist"
/usr/libexec/PlistBuddy -c "Delete SketchUp.WelcomeDialog.ShowOnStartup" "${USERPREFS_DIR}/com.google.sketchupfree8.plist"
/usr/libexec/PlistBuddy -c "Add SketchUp.WelcomeDialog.ShowOnStartup string 'NO'" "${USERPREFS_DIR}/com.google.sketchupfree8.plist"

# Disable StuffIt Expander updates, registration nags and Application folder notifications.

/usr/libexec/PlistBuddy -c "Delete SUEnableAutomaticChecks" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Add SUEnableAutomaticChecks bool FALSE" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Delete SUHasLaunchedBefore" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Add SUHasLaunchedBefore bool TRUE" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Delete SUSendProfileInfo" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Add SUSendProfileInfo bool FALSE" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Delete moveToApplicationsFolderAlertSuppress" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Add moveToApplicationsFolderAlertSuppress bool TRUE" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Delete registrationAction" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Add registrationAction integer 2" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Delete useDailyLogFile" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"
/usr/libexec/PlistBuddy -c "Add useDailyLogFile bool FALSE" "${USERPREFS_DIR}/com.stuffit.StuffIt-Expander.plist"

# Disables Miro Video Converter updates by setting last check time far in future. (NOTE:
# This is overwritten if updates are checked for manually.)

/usr/libexec/PlistBuddy -c "Delete SULastCheckTime" "${USERPREFS_DIR}/org.participatoryculture.MiroVideoConverter.plist"
/usr/libexec/PlistBuddy -c "Add SULastCheckTime date Sun Jan 01 11:00:00 EST 4001" "${USERPREFS_DIR}/org.participatoryculture.MiroVideoConverter.plist"

# Disables Skype updates and welcome screen.

/usr/libexec/PlistBuddy -c "Delete SKAllowStealthUpgrade" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Add SKAllowStealthUpgrade bool FALSE" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Delete SKShowWelcomeOnLogin" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Add SKShowWelcomeOnLogin bool FALSE" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Delete SKSilentUpgradeNoticeScreen" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Add SKSilentUpgradeNoticeScreen bool FALSE" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Delete SKSilentUpgradeNoticeShown" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Add SKSilentUpgradeNoticeShown bool TRUE" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Delete SKShowSplash" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Add SKShowSplash string 'NO'" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Delete DialpadOpen" "${USERPREFS_DIR}/com.skype.skype.plist"
/usr/libexec/PlistBuddy -c "Add DialpadOpen bool FALSE" "${USERPREFS_DIR}/com.skype.skype.plist"

# Disables NoteShare Viewer upgrade notifications and EULA.

/usr/libexec/PlistBuddy -c "Delete NotifyWhenUpdateAvailable" "${USERPREFS_DIR}/com.aquaminds.NoteShare.plist"
/usr/libexec/PlistBuddy -c "Add NotifyWhenUpdateAvailable bool FALSE" "${USERPREFS_DIR}/com.aquaminds.NoteShare.plist"
/usr/libexec/PlistBuddy -c "Delete ViewerLicensePresented" "${USERPREFS_DIR}/com.aquaminds.NoteShare.plist"
/usr/libexec/PlistBuddy -c "Add ViewerLicensePresented bool TRUE" "${USERPREFS_DIR}/com.aquaminds.NoteShare.plist"

# Disables VLC updates and usage logging.

/usr/libexec/PlistBuddy -c "Delete SUHasLaunchedBefore" "${USERPREFS_DIR}/org.videolan.vlc.plist"
/usr/libexec/PlistBuddy -c "Add SUHasLaunchedBefore bool TRUE" "${USERPREFS_DIR}/org.videolan.vlc.plist"
/usr/libexec/PlistBuddy -c "Delete SUEnableAutomaticChecks" "${USERPREFS_DIR}/org.videolan.vlc.plist"
/usr/libexec/PlistBuddy -c "Add SUEnableAutomaticChecks bool FALSE" "${USERPREFS_DIR}/org.videolan.vlc.plist"
/usr/libexec/PlistBuddy -c "Delete SUSendProfileInfo" "${USERPREFS_DIR}/org.videolan.vlc.plist"
/usr/libexec/PlistBuddy -c "Add SUSendProfileInfo bool FALSE" "${USERPREFS_DIR}/org.videolan.vlc.plist"
/usr/libexec/PlistBuddy -c "Delete VLCPreferencesVersion" "${USERPREFS_DIR}/org.videolan.vlc.plist"
/usr/libexec/PlistBuddy -c "Add VLCPreferencesVersion integer 100" "${USERPREFS_DIR}/org.videolan.vlc.plist"

# Disables iTunes EULA, welcome window and updates
# See http://support.apple.com/kb/HT3490 for more...

/usr/libexec/PlistBuddy -c "Delete license-agreements" "${USERPREFS_DIR}/com.apple.iTunes.plist"
# iTunes 10.6
/usr/libexec/PlistBuddy -c "Add license-agreements:EA0814 bool TRUE" "${USERPREFS_DIR}/com.apple.iTunes.plist"
# iTunes 10.7
/usr/libexec/PlistBuddy -c "Add license-agreements:EA0941 bool TRUE" "${USERPREFS_DIR}/com.apple.iTunes.plist"
/usr/libexec/PlistBuddy -c "Delete disableFirstRunWelcomeWindow" "${USERPREFS_DIR}/com.apple.iTunes.plist"
/usr/libexec/PlistBuddy -c "Add disableFirstRunWelcomeWindow bool TRUE" "${USERPREFS_DIR}/com.apple.iTunes.plist"
/usr/libexec/PlistBuddy -c "Delete disableCheckForApplicationUpdates" "${USERPREFS_DIR}/com.apple.iTunes.plist"
/usr/libexec/PlistBuddy -c "Add disableCheckForApplicationUpdates bool TRUE" "${USERPREFS_DIR}/com.apple.iTunes.plist"

# Disables MS Office 2004/2008 update notifications, Setup Assistant and set the default files to .Doc, .Xls, .Ppt (for 2008)

/usr/libexec/PlistBuddy -c "Delete HowToCheck" "${USERPREFS_DIR}/com.microsoft.autoupdate2.plist"
/usr/libexec/PlistBuddy -c "Add HowToCheck string 'Manual'" "${USERPREFS_DIR}/com.microsoft.autoupdate2.plist"
/usr/libexec/PlistBuddy -c "Delete HowToCheck" "${USERPREFS_DIR}/com.microsoft.autoupdate.plist"
/usr/libexec/PlistBuddy -c "Add HowToCheck string 'Manual'" "${USERPREFS_DIR}/com.microsoft.autoupdate.plist"
/usr/libexec/PlistBuddy -c "Delete 2008\\\FirstRun\\\SetupAssistCompleted" "${USERPREFS_DIR}/com.microsoft.office.plist"
/usr/libexec/PlistBuddy -c "Add 2008\\\FirstRun\\\SetupAssistCompleted integer 1" "${USERPREFS_DIR}/com.microsoft.office.plist"
/usr/libexec/PlistBuddy -c "Delete 2008\\\Default\ Save\\\Default\ Format" "${USERPREFS_DIR}/com.microsoft.Word.plist"
/usr/libexec/PlistBuddy -c "Add 2008\\\Default\ Save\\\Default\ Format string 'Doc97'" "${USERPREFS_DIR}/com.microsoft.Word.plist"
/usr/libexec/PlistBuddy -c "Delete 2008\\\Default\ Save\\\Default\ Format" "${USERPREFS_DIR}/com.microsoft.Excel.plist"
/usr/libexec/PlistBuddy -c "Add 2008\\\Default\ Save\\\Default\ Format integer 57" "${USERPREFS_DIR}/com.microsoft.Excel.plist"
# PowerPoint has Default Save twice for some reason...
/usr/libexec/PlistBuddy -c "Delete 2008\\\Default\ Save\\\Default\ Save\\\Default\ Format" "${USERPREFS_DIR}/com.microsoft.Powerpoint.plist"
/usr/libexec/PlistBuddy -c "Add 2008\\\Default\ Save\\\Default\ Save\\\Default\ Format string 'Microsoft\ PowerPoint\ 98\ Presentation'" "${USERPREFS_DIR}/com.microsoft.Powerpoint.plist"

# Disables the OpenXML Converter pop-up

/usr/libexec/PlistBuddy -c "Delete noDLWarning" "${USERPREFS_DIR}/com.microsoft.OfficeConverter.plist"
/usr/libexec/PlistBuddy -c "Add noDLWarning bool TRUE" "${USERPREFS_DIR}/com.microsoft.OfficeConverter.plist"

# Disables Alice's EULA pop-ups

/usr/libexec/PlistBuddy -c "Delete /org/lgna/project/:isLicenseAccepted" "${USERPREFS_DIR}/org.lgna.project.plist"
/usr/libexec/PlistBuddy -c "Add /org/lgna/project/:isLicenseAccepted string 'true'" "${USERPREFS_DIR}/org.lgna.project.plist"
/usr/libexec/PlistBuddy -c "Delete /edu/cmu/cs/:dennisc/:nebulous/:isLicenseAccepted" "${USERPREFS_DIR}/edu.cmu.cs.plist"
/usr/libexec/PlistBuddy -c "Add /edu/cmu/cs/:dennisc/:nebulous/:isLicenseAccepted string 'true'" "${USERPREFS_DIR}/edu.cmu.cs.plist"

# Sets default program associations.

/usr/libexec/PlistBuddy -c "Add LSHandlers array" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:0 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:0:LSHandlerContentType string 'com.adobe.pdf'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:0:LSHandlerRoleAll string 'com.adobe.reader'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:1 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:1:LSHandlerURLScheme string 'http'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:1:LSHandlerRoleAll string 'org.mozilla.firefox'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:2 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:2:LSHandlerURLScheme string 'https'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:2:LSHandlerRoleAll string 'org.mozilla.firefox'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:3 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:3:LSHandlerURLScheme string 'ftp'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:3:LSHandlerRoleAll string 'org.mozilla.firefox'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:4 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:4:LSHandlerContentType string 'public.html'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:4:LSHandlerRoleAll string 'org.mozilla.firefox'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:5 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:5:LSHandlerContentType string 'com.microsoft.excel.xls'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:5:LSHandlerRoleAll string 'com.microsoft.Excel'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:6 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:6:LSHandlerContentType string 'org.openxmlformats.spreadsheetml.sheet'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:6:LSHandlerRoleAll string 'com.microsoft.Excel'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:7 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:7:LSHandlerContentType string 'com.microsoft.powerpoint.ppt'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:7:LSHandlerRoleAll string 'com.microsoft.Powerpoint'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:8 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:8:LSHandlerContentType string 'org.openxmlformats.presentationml.presentation'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:8:LSHandlerRoleAll string 'com.microsoft.Powerpoint'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:9 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:9:LSHandlerContentType string 'com.microsoft.word.doc'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:9:LSHandlerRoleAll string 'com.microsoft.Word'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:10 dict" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:10:LSHandlerContentType string 'org.openxmlformats.wordprocessingml.document'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"
/usr/libexec/PlistBuddy -c "Add LSHandlers:10:LSHandlerRoleAll string 'com.microsoft.Word'" "${USERPREFS_DIR}/com.apple.LaunchServices.plist"

# Disables Roxio Toast 6 Titanium Setup Assistant

/usr/libexec/PlistBuddy -c "Delete last\ setup\ assistant\ run\ version" "${USERPREFS_DIR}/com.roxio.Toast.plist"
/usr/libexec/PlistBuddy -c "Add last\ setup\ assistant\ run\ version integer 100696064" "${USERPREFS_DIR}/com.roxio.Toast.plist"

# Exit with zero status.

exit 0
