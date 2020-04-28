## Reason Remote Codec for ICON QConProG2 (Mackie Controller Clone)

QConProG2 is a nice DAW controller at reasonable price. Unfortunately, like most Mackie Controller clones,
also the QConProG2 only supports the standardized functionality of the underlying protocol that is MCU.
Imho, MCU was nice but does match the different abilities of modern DAWs anymore. There is so much more
one could do with this kind of hardware and MCU is limited in it's definition.

This results in the situation, that the buttons and encoders don't match for nearly any DAW anymore.
Added the fact, that every DAW manufacturer has different mappings of functions to the MCU functions
and controller manufacturers usually only ship with an overlay of the mapped functions for your DAW,
no matter if the mapped functions make sense or not, one is forced to rearrange the mappings to your
own needs. Of course, if you do that, you can't use the overlays anymore (sigh).

To overcome this situation, I decided to recode the mackie codec, which comes with Reason and implement
the mappings the way I seem fit for Reason.  As Reason itself is limited regarding the so called 
'remotable items', so things like Mark/Cut/Paste don't make sense.

### Featureset
The goal of this codec was, to use as many functions as possible, the way they are printed on the controller.
So I tried to make sense of the button texts with regards of what's remotable in Reason anyway.

#### Button Mappings
- The Select Buttons indicate the state with the LED (compared to standard Mackie codec, where the channel is selected, but the corresponding LEDs remain off)
- The Master Button is used to 'select' the settings of the master section, interlocked with the Select Buttons.
- The Solo Button of the master section clears any active solo of the mixer section.
- The SMPTE/Beats LEDs work they should when switching between SMPTE and Beats.
- The Undo/Redo Buttons are mapped correctly.
- F1 = New Overdub
- F2 = New Alternative Take
- Project = Edit BPM with wheel On/Off
- Mixer = Click On/Off
- Motors = Precount On/Off
- Left/Right = Edit On/Off Loop Markers L/R
- VST = Edit Click Level with wheel On/Off
- Read = Target Track Automation On/Off
- Write = Reset Automation Overwrite

#### Assignment Buttons in Multichannel Mode (no channel nor master section is selected)
- Upper LCD Row shows the rotary functions
- Lower LCD Row shows the mapped record button function
- Pan:      Rotaries = Pan
- Insert:   Rotaries = Input Gain
- EQ:       no functions (full EQ available per selected channel)
- FX Send:  no functions (full Send Level Busses available per selected channel)

#### Assignment Buttons when a channel is selected
- Upper LCD Row shows the rotary functions
- Lower LCD Row shows the mapped record button function
- Pan:      Rotaries = Low/High Pass Freq/On/Off + Insert Levels 1-4/On/Off + ByPass + Toggle-Order-Of-Inserts-Comp 
- Insert:   Rotaries = Compressor and Gate Settings
- EQ:       Rotaries = EQ Filter Settings without Low/High Pass
- FX Send:  Rotaries = FX Send Level Busses 1-8 / On/Off

#### Assignment Buttons when master section is selected
- Upper LCD Row shows the rotary functions
- Lower LCD Row shows the mapped record button function
- Pan:      no functions
- Insert:   Rotaries = Compressor and Gate Settings
- EQ:       no functions
- FX Send:  Rotaries = Master FX Return Level + Mute On/Off

#### Known Issues
- The Record Buttons are not working, because the 'Record Arm' command is not remotable (=not supported by Reason)
- The Save Button is unused, mapped to no function, because the Save command is not remotable
- These buttons are mapped to no function.
    - Save
    - Layer
    - F3-F8
    - Page Up/Down
    - Name/Value
    - Sends

### Installation
#### Mac:
```bash
# first go to a folder where you want to clone the git repo
# then invoke the git clone command
# -> this will create a folder named 'reason-remote
git clone https://github.com/schroederw/reason-remote.git

# or using ssh
git clone git@github.com:schroederw/reason-remote.git

# enter the git folder
cd reason-remote

# to install
./install.sh

# to uninstall
./uninstall.sh
```

#### QCon ProG2 Setup:
- Switch on your Qcon ProG2 and choose Logic Pro Mode!

#### Reason Setup:
The QCon Pro G2 seem not to support an autodetection probe call using MIDI System Messages.
Because of that, you have to select the controller manually.
Select Preferences in the 'Reason' menu (Mac) and select the 'external controller' tab.
Click 'Add manually' and select 'Icon' as the manufacturer.
Since there only one model to choose, the QCon Pro G2 should be selected automatically.
Then chose the MIDI input and output ports using the displayed version.

#### Why Logic Pro Mode and not Mackie Control Mode?
Like I already mentioned, in my opinion, the Mackie Mode is limited due to its defintion.
In case of the QCon Pro G2 this means, I can't map the functions the way I like in Mackie Mode.
E.g. not all buttons can be used with the status LED indicating a state, like 'Click On/Off'.
In Logic Pro Mode, this drawback is at least 'milder'. In Logic Pro mode, most buttons may be
used with a status LED, if I see it fit.   
