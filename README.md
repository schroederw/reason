## Reason Remote Codec for ICON QConProG2 (Mackie Controller Clone)

QConProG2 is a nice DAW controller at reasonable price. Unfortunately, like most Mackie Controller clones, also the QConProG2 only supports the standardized functionality of the underlying protocol that is MCU. Imho, MCU was nice but does match the different abilities of modern DAWs anymore. There is so much more one could do with this kind of hardware and MCU is limited in it's definition.

This results in the situation, that the buttons and encoders don't match for nearly any DAW anymore. Added the fact, that every DAW manufacturer has different mappings of functions to the MCU functions and controller manufacturers usually only ship with an overlay of the mapped functions for your DAW, no matter if the mapped functions make sense or not, one is forced to rearrange the mappings to your own needs. Of course, if you do that, you can't use the overlays anymore (sigh).

To overcome this situation, I decided to recode the mackie codec, which comes with Reason and implement the mappings the way I seem fit for Reason.  As Reason itself is limited regarding the so called 'remotable items', so things like Mark/Cut/Paste don't make sense.

### Featureset
TODO

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
- Switch on your Qcon ProG2 and choose Logic Mode!

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
