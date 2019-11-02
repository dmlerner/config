// -*- mode: c++ -*-
// Copyright 2016 Keyboardio, inc. <jesse@keyboard.io>
// See "LICENSE" for license details

#ifndef BUILD_INFORMATION
#define BUILD_INFORMATION "locally built"
#endif

// The Kaleidoscope core
#include "Kaleidoscope.h"
#include <Kaleidoscope-LED-ActiveModColor.h>
#include <Kaleidoscope-MacrosOnTheFly.h>
#include <Kaleidoscope-KeyLogger.h>
// Support for storing the keymap in EEPROM
//#include "Kaleidoscope-EEPROM-Settings.h"
//#include "Kaleidoscope-EEPROM-Keymap.h"
#include <Kaleidoscope-OneShot.h>

// Support for communicating with the host via a simple Serial protocol
//#include "Kaleidoscope-FocusSerial.h"

// Support for keys that move the mouse
#include "Kaleidoscope-MouseKeys.h"

// Support for macros
#include "Kaleidoscope-Macros.h"

// Support for controlling the keyboard's LEDs
#include "Kaleidoscope-LEDControl.h"

// Support for "Numpad" mode, which is mostly just the Numpad specific LED mode
#include "Kaleidoscope-NumPad.h"

// Support for the "Boot greeting" effect, which pulses the 'LED' button for 10s
// when the keyboard is connected to a computer (or that computer is powered on)
#include "Kaleidoscope-LEDEffect-BootGreeting.h"

// Support for LED modes that set all LEDs to a single color
#include "Kaleidoscope-LEDEffect-SolidColor.h"

// Support for an LED mode that makes all the LEDs 'breathe'
#include "Kaleidoscope-LEDEffect-Breathe.h"

// Support for LED modes that pulse the keyboard's LED in a rainbow pattern
#include "Kaleidoscope-LEDEffect-Rainbow.h"

// Support for Keyboardio's internal keyboard testing mode
#include "Kaleidoscope-Model01-TestMode.h"

// Support for host power management (suspend & wakeup)
#include "Kaleidoscope-HostPowerManagement.h"

// Support for USB quirks, like changing the key state report protocol
#include "Kaleidoscope-USB-Quirks.h"

#include <Kaleidoscope-Heatmap.h>

#include <Kaleidoscope-Qukeys.h>

enum { MACRO_VERSION_INFO,
       MACRO_ANY
     }; 
     
enum { PRIMARY, NUMPAD, FUNCTIONLEFT, FUNCTIONRIGHT, MEDIA }; // layers

#define PRIMARY_KEYMAP_QWERTY



// *INDENT-OFF*

KEYMAPS(

  [PRIMARY] = KEYMAP_STACKED
  (Key_CapsLock,          Key_1, Key_2, Key_3, Key_4, Key_5, Key_LEDEffectNext,
   Key_Tab, Key_Q, Key_W, Key_E, Key_R, Key_T, Key_Backtick,
   Key_RightShift,   Key_A, Key_S, Key_D, Key_F, Key_G,
   Key_Space, Key_Z, Key_X, Key_C, Key_V, Key_B, OSL(MEDIA),
   Key_Enter, Key_Escape,Key_MacroRec, ___,
   OSL(FUNCTIONLEFT),

   Key_Delete,  Key_6, Key_7, Key_8,     Key_9,         Key_0,         LockLayer(NUMPAD),
   Key_Backspace,     Key_Y, Key_U, Key_I,     Key_O,         Key_P,         Key_Equals,
                      Key_H, Key_J, Key_K,     Key_L,         Key_Semicolon, Key_Quote,
   Key_RightAlt,    Key_N, Key_M, Key_Comma, Key_Period,    Key_Slash,     Key_Minus,
   ___,             Key_MacroPlay,  Key_Backspace, Key_Space,
   OSL(FUNCTIONRIGHT)),




  [NUMPAD] =  KEYMAP_STACKED
  (___, ___, ___, ___, ___, ___, ___,
   ___, ___, ___, ___, ___, ___, ___,
        ___, Key_mouseWarpNW, Key_mouseWarpNE, Key_mouseWarpSE, Key_mouseWarpSW, Key_mouseWarpEnd,
   ___, ___, ___, ___, ___, ___, ___,
   ___, ___, ___, ___,
   ___,

   M(MACRO_VERSION_INFO),  ___, Key_Keypad7, Key_Keypad8,   Key_Keypad9,        Key_KeypadSubtract, ___,
   ___,                    ___, Key_Keypad4, Key_Keypad5,   Key_Keypad6,        Key_KeypadAdd,      ___,
                           ___, Key_Keypad1, Key_Keypad2,   Key_Keypad3,        Key_Equals,         ___,
   ___,                    ___, Key_Keypad0, Key_KeypadDot, Key_KeypadMultiply, Key_KeypadDivide,   Key_Enter,
   ___, ___, ___, ___,
   ___),

  [FUNCTIONLEFT] =  KEYMAP_STACKED
  (___,      Key_F1,           Key_F2,      Key_F3,     Key_F4,        Key_F5,           ___,
   ___,  ___,              ___, ___,        ___, ___, ___,
   ___, LSHIFT(Key_1),  LSHIFT(Key_2), LSHIFT(Key_3), LSHIFT(Key_4), ___,                                      
   ___,  Key_Backslash,    Key_Equals, Key_Quote, LSHIFT(Key_Quote), ___,  ___,
   ___, ___, ___, ___,
   ___,

   ___, Key_F6,                 Key_F7,                   Key_F8,                   Key_F9,          Key_F10,          Key_F11,
   ___,    ___, ___,     ___,    ___, ___, Key_F12,
                               ___,LSHIFT(Key_5),  LSHIFT(Key_6), LSHIFT(Key_7), LSHIFT(Key_8),          ___,
   ___,                Key_Minus,            LSHIFT(Key_Minus), LSHIFT(Key_Equals), Key_Pipe,           ___, ___,
   ___, ___, ___, ___,
   ___),

  [FUNCTIONRIGHT] =  KEYMAP_STACKED
  (___,      Key_F1,           Key_F2,      Key_F3,     Key_F4,        Key_F5,           ___,
   ___,  ___,              ___, ___,        ___, ___, ___,
   ___, Key_LeftBracket,  Key_RightBracket,        Key_LeftParen, Key_RightParen,   ___,
   ___,  ___,  ___,  ___,        ___, ___,  ___,
   ___, ___, ___, ___,
   ___,

   ___, Key_F6,                 Key_F7,                   Key_F8,                   Key_F9,          Key_F10,          Key_F11,
   ___,    ___, ___,     ___,    ___, ___, Key_F12,
                              ___, Key_LeftCurlyBracket,          Key_RightCurlyBracket,            LSHIFT(Key_Comma),        LSHIFT(Key_Period),  ___,              
   ___,          ___,          ___, ___, ___,             ___,    ___,
   ___, ___, ___, ___,
   ___),

  [MEDIA] =  KEYMAP_STACKED
  (___,     ___,___,___,___,___,           ___,
   ___,  ___, Key_mouseWarpNW,             Key_mouseUp, Key_mouseWarpNE,       ___, ___, 
    ___, ___, Key_mouseL,          Key_mouseDn,           Key_mouseR,        ___,   
   ___,  ___,   Key_mouseWarpSW,           Key_mouseWarpEnd,        Key_mouseWarpSE, ___,  ___,
   ___, ___, ___, ___,
   ___,

 ___,     ___,___,___,___,___,           ___,
   ___,    Consumer_ScanPreviousTrack, Consumer_ScanNextTrack,  Consumer_PlaySlashPause, Consumer_VolumeDecrement, Consumer_VolumeIncrement, ___,
           Key_LeftArrow,  Key_DownArrow,        Key_UpArrow, Key_RightArrow,   Consumer_Mute, ___,        
   ___,          ___,          Key_mouseScrollDn, Key_mouseScrollUp, Key_mouseBtnL, Key_mouseBtnR,    ___,
   ___, ___, ___, ___,
   ___)
) 


/* Re-enable astyle's indent enforcement */
// *INDENT-ON*


static void versionInfoMacro(uint8_t keyState) {
  if (keyToggledOn(keyState)) {
    Macros.type(PSTR("Keyboardio Model 01 - Kaleidoscope "));
    Macros.type(PSTR(BUILD_INFORMATION));
  }
}

const macro_t *macroAction(uint8_t macroIndex, uint8_t keyState) {
  switch (macroIndex) {

    case MACRO_VERSION_INFO:
      versionInfoMacro(keyState);
      break;


  }
  return MACRO_NONE;
}



// These 'solid' color effect definitions define a rainbow of
// LED color modes calibrated to draw 500mA or less on the
// Keyboardio Model 01.


static kaleidoscope::LEDSolidColor solidRed(160, 0, 0);
static kaleidoscope::LEDSolidColor solidOrange(140, 70, 0);
static kaleidoscope::LEDSolidColor solidYellow(130, 100, 0);
static kaleidoscope::LEDSolidColor solidGreen(0, 160, 0);
static kaleidoscope::LEDSolidColor solidBlue(0, 70, 130);
static kaleidoscope::LEDSolidColor solidIndigo(0, 0, 170);
static kaleidoscope::LEDSolidColor solidViolet(130, 0, 120);

/** toggleLedsOnSuspendResume toggles the LEDs off when the host goes to sleep,
   and turns them back on when it wakes up.
*/
void toggleLedsOnSuspendResume(kaleidoscope::HostPowerManagement::Event event) {
  switch (event) {
    case kaleidoscope::HostPowerManagement::Suspend:
      LEDControl.paused = true;
      LEDControl.set_all_leds_to({0, 0, 0});
      LEDControl.syncLeds();
      break;
    case kaleidoscope::HostPowerManagement::Resume:
      LEDControl.paused = false;
      LEDControl.refreshAll();
      break;
    case kaleidoscope::HostPowerManagement::Sleep:
      break;
  }
}

/** hostPowerManagementEventHandler dispatches power management events (suspend,
   resume, and sleep) to other functions that perform action based on these
   events.
*/
void hostPowerManagementEventHandler(kaleidoscope::HostPowerManagement::Event event) {
  toggleLedsOnSuspendResume(event);
}

KALEIDOSCOPE_INIT_PLUGINS(
  Qukeys,
  // The EEPROMSettings & EEPROMKeymap plugins make it possible to have an
  // editable keymap in EEPROM.
  // EEPROMSettings,
  // EEPROMKeymap,

  // Focus allows bi-directional communication with the host, and is the
  // interface through which the keymap in EEPROM can be edited.
  // Focus,

  // FocusSettingsCommand adds a few Focus commands, intended to aid in
  // changing some settings of the keyboard, such as the default layer (via the
  // `settings.defaultLayer` command)
  //FocusSettingsCommand,

  // FocusEEPROMCommand adds a set of Focus commands, which are very helpful in
  // both debugging, and in backing up one's EEPROM contents.
  // FocusEEPROMCommand,

  // The boot greeting effect pulses the LED button for 10 seconds after the
  // keyboard is first connected
  BootGreetingEffect,

  // The hardware test mode, which can be invoked by tapping Prog, LED and the
  // left Fn button at the same time.
  TestMode,

  // LEDControl provides support for other LED modes
  LEDControl,

  // We start with the LED effect that turns off all the LEDs.
  LEDOff,

  // The rainbow effect changes the color of all of the keyboard's keys at the same time
  // running through all the colors of the rainbow.
  //LEDRainbowEffect,

  LEDRainbowWaveEffect,

  // These static effects turn your keyboard's LEDs a variety of colors
  //solidRed, solidOrange, solidYellow, solidGreen, solidBlue, solidIndigo, solidViolet,

  // The breathe effect slowly pulses all of the LEDs on your keyboard
  //LEDBreatheEffect,

  // The numpad plugin is responsible for lighting up the 'numpad' mode
  // with a custom LED effect
  NumPad,

  // The macros plugin adds support for macros
  Macros,

  // The MouseKeys plugin lets you add keys to your keymap which move the mouse.
  // MouseKeys,

  // The HostPowerManagement plugin allows us to turn LEDs off when then host
  // goes to sleep, and resume them when it wakes up.
  HostPowerManagement,

  // The MagicCombo plugin lets you use key combinations tfo trigger custom
  // actions - a bit like Macros, but triggered by pressing multiple keys at the
  // same time.
  //MagicCombo,

  // The USBQuirks plugin lets you do some things with USB that we aren't
  // comfortable - or able - to do automatically, but can be useful
  // nevertheless. Such as toggling the key report protocol between Boot (used
  // by BIOSes) and Report (NKRO).
  USBQuirks,

  HeatmapEffect,
  OneShot,
  ActiveModColorEffect,
  MacrosOnTheFly,
  MouseKeys
);


void setup() {
  Serial.begin(9600);
  QUKEYS (
    kaleidoscope::Qukey(0, 0, 7, Key_LeftControl),      // enter/control
    kaleidoscope::Qukey(0, 1, 7, Key_LeftGui),      // esc/win
    //   kaleidoscope::Qukey(0, 0, 8, Key_RightAlt), // space/alt
    kaleidoscope::Qukey(0, 1, 8, Key_RightShift), // backspace/shift

 
  )
  Qukeys.setTimeout(250);
  Qukeys.setReleaseDelay(300);
  KALEIDOSCOPE_INIT_USER(KeyLogger);


  // First, call Kaleidoscope's internal setup function
  Kaleidoscope.setup();

  // While we hope to improve this in the future, the NumPad plugin
  // needs to be explicitly told which keymap layer is your numpad layer
  NumPad.numPadLayer = NUMPAD;

  // We configure the AlphaSquare effect to use RED letters
  //  AlphaSquare.color = CRGB(255, 0, 0);

  // We set the brightness of the rainbow effects to 150 (on a scale of 0-255)
  // This draws more than 500mA, but looks much nicer than a dimmer effect
  LEDRainbowEffect.brightness(150);
  LEDRainbowWaveEffect.brightness(150);

  // The LED Stalker mode has a few effects. The one we like is called
  // 'BlazingTrail'. For details on other options, see
  // https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/LED-Stalker.md
  // StalkerEffect.variant = STALKER(BlazingTrail);

  HeatmapEffect.activate();

  // We want to make sure that the firmware starts with LED effects off
  // This avoids over-taxing devices that don't have a lot of power to share
  // with USB devices
  LEDOff.activate();

  // To make the keymap editable without flashing new firmware, we store
  // additional layers in EEPROM. For now, we reserve space for five layers. If
  // one wants to use these layers, just set the default layer to one in EEPROM,
  // by using the `settings.defaultLayer` Focus command.
  //EEPROMKeymap.setup(5, EEPROMKeymap.Mode::EXTEND);
    ActiveModColorEffect.highlight_color = CRGB(0x00, 0xff, 0xff);
    MouseKeys.setWarpGridSize(MOUSE_WARP_GRID_2X2);

  MouseKeys.accelSpeed = 1;
  MouseKeys.setSpeedLimit(24);
  MouseKeys.wheelSpeed = 10;
  MouseKeys.wheelDelay = 200;
}

/** loop is the second of the standard Arduino sketch functions.
    As you might expect, it runs in a loop, never exiting.

    For Kaleidoscope-based keyboard firmware, you usually just want to
    call Kaleidoscope.loop(); and not do anything custom here.
*/

void loop() {
  Kaleidoscope.loop();
}
