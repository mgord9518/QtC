#pragma once

#include "private/widget_defs.h"
#include "private/common.h"

#ifdef __cplusplus
extern "C" {
#endif

QtC_COMMON_DECLS(Icon);

typedef enum QtC_Icon_ThemeIcon {
    QtC_Icon_ThemeIcon_AddressBookNew = 0,
    QtC_Icon_ThemeIcon_ApplicationExit = 1,
    QtC_Icon_ThemeIcon_AppointmentNew = 2,
    QtC_Icon_ThemeIcon_CallStart = 3,
    QtC_Icon_ThemeIcon_CallStop = 4,
    QtC_Icon_ThemeIcon_ContactNew = 5,
    QtC_Icon_ThemeIcon_DocumentNew = 6,
    QtC_Icon_ThemeIcon_DocumentOpen = 7,
    QtC_Icon_ThemeIcon_DocumentOpenRecent = 8,
    QtC_Icon_ThemeIcon_DocumentPageSetup = 9,
    QtC_Icon_ThemeIcon_DocumentPrint = 10,
    QtC_Icon_ThemeIcon_DocumentPrintPreview = 11,
    QtC_Icon_ThemeIcon_DocumentProperties = 12,
    QtC_Icon_ThemeIcon_DocumentRevert = 13,
    QtC_Icon_ThemeIcon_DocumentSave = 14,
    QtC_Icon_ThemeIcon_DocumentSaveAs = 15,
    QtC_Icon_ThemeIcon_DocumentSend = 16,
    QtC_Icon_ThemeIcon_EditClear = 17,
    QtC_Icon_ThemeIcon_EditCopy = 18,
    QtC_Icon_ThemeIcon_EditCut = 19,
    QtC_Icon_ThemeIcon_EditDelete = 20,
    QtC_Icon_ThemeIcon_EditFind = 21,
    QtC_Icon_ThemeIcon_EditPaste = 22,
    QtC_Icon_ThemeIcon_EditRedo = 23,
    QtC_Icon_ThemeIcon_EditSelectAll = 24,
    QtC_Icon_ThemeIcon_EditUndo = 25,
    QtC_Icon_ThemeIcon_FolderNew = 26,
    QtC_Icon_ThemeIcon_FormatIndentLess = 27,
    QtC_Icon_ThemeIcon_FormatIndentMore = 28,
    QtC_Icon_ThemeIcon_FormatJustifyCenter = 29,
    QtC_Icon_ThemeIcon_FormatJustifyFill = 30,
    QtC_Icon_ThemeIcon_FormatJustifyLeft = 31,
    QtC_Icon_ThemeIcon_FormatJustifyRight = 32,
    QtC_Icon_ThemeIcon_FormatTextDirectionLtr = 33,
    QtC_Icon_ThemeIcon_FormatTextDirectionRtl = 34,
    QtC_Icon_ThemeIcon_FormatTextBold = 35,
    QtC_Icon_ThemeIcon_FormatTextItalic = 36,
    QtC_Icon_ThemeIcon_FormatTextUnderline = 37,
    QtC_Icon_ThemeIcon_FormatTextStrikethrough = 38,
    QtC_Icon_ThemeIcon_GoDown = 39,
    QtC_Icon_ThemeIcon_GoHome = 40,
    QtC_Icon_ThemeIcon_GoNext = 41,
    QtC_Icon_ThemeIcon_GoPrevious = 42,
    QtC_Icon_ThemeIcon_GoUp = 43,
    QtC_Icon_ThemeIcon_HelpAbout = 44,
    QtC_Icon_ThemeIcon_HelpFaq = 45,
    QtC_Icon_ThemeIcon_InsertImage = 46,
    QtC_Icon_ThemeIcon_InsertLink = 47,
    QtC_Icon_ThemeIcon_InsertText = 48,
    QtC_Icon_ThemeIcon_ListAdd = 49,
    QtC_Icon_ThemeIcon_ListRemove = 50,
    QtC_Icon_ThemeIcon_MailForward = 51,
    QtC_Icon_ThemeIcon_MailMarkImportant = 52,
    QtC_Icon_ThemeIcon_MailMarkRead = 53,
    QtC_Icon_ThemeIcon_MailMarkUnread = 54,
    QtC_Icon_ThemeIcon_MailMessageNew = 55,
    QtC_Icon_ThemeIcon_MailReplyAll = 56,
    QtC_Icon_ThemeIcon_MailReplySender = 57,
    QtC_Icon_ThemeIcon_MailSend = 58,
    QtC_Icon_ThemeIcon_MediaEject = 59,
    QtC_Icon_ThemeIcon_MediaPlaybackPause = 60,
    QtC_Icon_ThemeIcon_MediaPlaybackStart = 61,
    QtC_Icon_ThemeIcon_MediaPlaybackStop = 62,
    QtC_Icon_ThemeIcon_MediaRecord = 63,
    QtC_Icon_ThemeIcon_MediaSeekBackward = 64,
    QtC_Icon_ThemeIcon_MediaSeekForward = 65,
    QtC_Icon_ThemeIcon_MediaSkipBackward = 66,
    QtC_Icon_ThemeIcon_MediaSkipForward = 67,
    QtC_Icon_ThemeIcon_ObjectRotateLeft = 68,
    QtC_Icon_ThemeIcon_ObjectRotateRight = 69,
    QtC_Icon_ThemeIcon_ProcessStop = 70,
    QtC_Icon_ThemeIcon_SystemLockScreen = 71,
    QtC_Icon_ThemeIcon_SystemLogOut = 72,
    QtC_Icon_ThemeIcon_SystemSearch = 73,
    QtC_Icon_ThemeIcon_SystemReboot = 74,
    QtC_Icon_ThemeIcon_SystemShutdown = 75,
    QtC_Icon_ThemeIcon_ToolsCheckSpelling = 76,
    QtC_Icon_ThemeIcon_ViewFullscreen = 77,
    QtC_Icon_ThemeIcon_ViewRefresh = 78,
    QtC_Icon_ThemeIcon_ViewRestore = 79,
    QtC_Icon_ThemeIcon_WindowClose = 80,
    QtC_Icon_ThemeIcon_WindowNew = 81,
    QtC_Icon_ThemeIcon_ZoomFitBest = 82,
    QtC_Icon_ThemeIcon_ZoomIn = 83,
    QtC_Icon_ThemeIcon_ZoomOut = 84,
    QtC_Icon_ThemeIcon_AudioCard = 85,
    QtC_Icon_ThemeIcon_AudioInputMicrophone = 86,
    QtC_Icon_ThemeIcon_Battery = 87,
    QtC_Icon_ThemeIcon_CameraPhoto = 88,
    QtC_Icon_ThemeIcon_CameraVideo = 89,
    QtC_Icon_ThemeIcon_CameraWeb = 90,
    QtC_Icon_ThemeIcon_Computer = 91,
    QtC_Icon_ThemeIcon_DriveHarddisk = 92,
    QtC_Icon_ThemeIcon_DriveOptical = 93,
    QtC_Icon_ThemeIcon_InputGaming = 94,
    QtC_Icon_ThemeIcon_InputKeyboard = 95,
    QtC_Icon_ThemeIcon_InputMouse = 96,
    QtC_Icon_ThemeIcon_InputTablet = 97,
    QtC_Icon_ThemeIcon_MediaFlash = 98,
    QtC_Icon_ThemeIcon_MediaOptical = 99,
    QtC_Icon_ThemeIcon_MediaTape = 100,
    QtC_Icon_ThemeIcon_MultimediaPlayer = 101,
    QtC_Icon_ThemeIcon_NetworkWired = 102,
    QtC_Icon_ThemeIcon_NetworkWireless = 103,
    QtC_Icon_ThemeIcon_Phone = 104,
    QtC_Icon_ThemeIcon_Printer = 105,
    QtC_Icon_ThemeIcon_Scanner = 106,
    QtC_Icon_ThemeIcon_VideoDisplay = 107,
    QtC_Icon_ThemeIcon_AppointmentMissed = 108,
    QtC_Icon_ThemeIcon_AppointmentSoon = 109,
    QtC_Icon_ThemeIcon_AudioVolumeHigh = 110,
    QtC_Icon_ThemeIcon_AudioVolumeLow = 111,
    QtC_Icon_ThemeIcon_AudioVolumeMedium = 112,
    QtC_Icon_ThemeIcon_AudioVolumeMuted = 113,
    QtC_Icon_ThemeIcon_BatteryCaution = 114,
    QtC_Icon_ThemeIcon_BatteryLow = 115,
    QtC_Icon_ThemeIcon_DialogError = 116,
    QtC_Icon_ThemeIcon_DialogInformation = 117,
    QtC_Icon_ThemeIcon_DialogPassword = 118,
    QtC_Icon_ThemeIcon_DialogQuestion = 119,
    QtC_Icon_ThemeIcon_DialogWarning = 120,
    QtC_Icon_ThemeIcon_FolderDragAccept = 121,
    QtC_Icon_ThemeIcon_FolderOpen = 122,
    QtC_Icon_ThemeIcon_FolderVisiting = 123,
    QtC_Icon_ThemeIcon_ImageLoading = 124,
    QtC_Icon_ThemeIcon_ImageMissing = 125,
    QtC_Icon_ThemeIcon_MailAttachment = 126,
    QtC_Icon_ThemeIcon_MailUnread = 127,
    QtC_Icon_ThemeIcon_MailRead = 128,
    QtC_Icon_ThemeIcon_MailReplied = 129,
    QtC_Icon_ThemeIcon_MediaPlaylistRepeat = 130,
    QtC_Icon_ThemeIcon_MediaPlaylistShuffle = 131,
    QtC_Icon_ThemeIcon_NetworkOffline = 132,
    QtC_Icon_ThemeIcon_PrinterPrinting = 133,
    QtC_Icon_ThemeIcon_SecurityHigh = 134,
    QtC_Icon_ThemeIcon_SecurityLow = 135,
    QtC_Icon_ThemeIcon_SoftwareUpdateAvailable = 136,
    QtC_Icon_ThemeIcon_SoftwareUpdateUrgent = 137,
    QtC_Icon_ThemeIcon_SyncError = 138,
    QtC_Icon_ThemeIcon_SyncSynchronizing = 139,
    QtC_Icon_ThemeIcon_UserAvailable = 140,
    QtC_Icon_ThemeIcon_UserOffline = 141,
    QtC_Icon_ThemeIcon_WeatherClear = 142,
    QtC_Icon_ThemeIcon_WeatherClearNight = 143,
    QtC_Icon_ThemeIcon_WeatherFewClouds = 144,
    QtC_Icon_ThemeIcon_WeatherFewCloudsNight = 145,
    QtC_Icon_ThemeIcon_WeatherFog = 146,
    QtC_Icon_ThemeIcon_WeatherShowers = 147,
    QtC_Icon_ThemeIcon_WeatherSnow = 148,
    QtC_Icon_ThemeIcon_WeatherStorm = 149,
} QtC_Icon_ThemeIcon ;

QtC_Icon* QtC_Icon_new();

QtC_Icon* QtC_Icon_fromTheme(
    QtC_Icon_ThemeIcon icon
);

#ifdef __cplusplus
}
#endif