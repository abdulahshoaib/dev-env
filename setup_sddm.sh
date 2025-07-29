#!/usr/bin/env bash

paru -S sddm-sugar-dark --needed --noconfirm

sudo tee /etc/sddm.conf > /dev/null <<EOF
[Theme]
Current=sugar-dark
EOF

# Copy wallpapers to ~/Wallpapers
./wallpaper/setup_wallpaper.sh

# sddm config
sudo tee /usr/share/sddm/themes/sugar-dark/Main.qml > /dev/null <<EOF
import QtQuick 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.15
import "Components"

Pane {
    id: root

    height: config.ScreenHeight || Screen.height
    width: config.ScreenWidth || Screen.ScreenWidth

    LayoutMirroring.enabled: config.ForceRightToLeft == "true" ? true : Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    padding: config.ScreenPadding
    palette.button: "transparent"
    palette.highlight: config.AccentColor
    palette.text: config.MainColor
    palette.buttonText: config.MainColor
    palette.window: "#444"

    font.family: config.Font
    font.pointSize: config.FontSize !== "" ? config.FontSize : parseInt(height / 80)
    focus: true

    property bool leftleft: config.HaveFormBackground == "true" &&
                            config.PartialBlur == "false" &&
                            config.FormPosition == "left" &&
                            config.BackgroundImageAlignment == "left"

    property bool leftcenter: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "left" &&
                              config.BackgroundImageAlignment == "center"

    property bool rightright: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "right" &&
                              config.BackgroundImageAlignment == "right"

    property bool rightcenter: config.HaveFormBackground == "true" &&
                               config.PartialBlur == "false" &&
                               config.FormPosition == "right" &&
                               config.BackgroundImageAlignment == "center"

    Item {
        id: sizeHelper
        anchors.fill: parent
        height: parent.height
        width: parent.width

	Rectangle {
	    id: formBackground

	    width: form.width * 0.8
	    height: form.height * 0.8

	    anchors.centerIn: form

	    color: "#000000"
	    opacity: 0.8
	    radius: 15
	    z: 1

	    Rectangle {
	        anchors.fill: parent
	        color: "#000000"
	        opacity: 0.3
	        radius: parent.radius

	        layer.enabled: true
	        layer.effect: FastBlur {
	            radius: 48
	            transparentBorder: true
	        }
	    }

	    Rectangle {
	        anchors.fill: parent
	        color: "#000000"
	        opacity: 0.5
	        radius: parent.radius
	    }
	}

        LoginForm {
            id: form

            height: virtualKeyboard.state == "visible" ? parent.height - virtualKeyboard.implicitHeight : parent.height
            width: parent.width / 2.5

            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            virtualKeyboardActive: virtualKeyboard.state == "visible" ? true : false
            z: 1
        }

        Button {
            id: vkb
            onClicked: virtualKeyboard.switchState()
            visible: virtualKeyboard.status == Loader.Ready && config.ForceHideVirtualKeyboardButton == "false"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: implicitHeight
            anchors.horizontalCenter: form.horizontalCenter
            z: 1
            contentItem: Text {
                text: config.TranslateVirtualKeyboardButton || "Virtual Keyboard"
                color: parent.visualFocus ? palette.highlight : palette.text
                font.pointSize: root.font.pointSize * 0.8
            }
            background: Rectangle {
                id: vkbbg
                color: "transparent"
            }
        }

        Loader {
            id: virtualKeyboard
            source: "Components/VirtualKeyboard.qml"
            state: "hidden"
            property bool keyboardActive: item ? item.active : false
            onKeyboardActiveChanged: keyboardActive ? state = "visible" : state = "hidden"
            width: parent.width
            z: 1
            function switchState() { state = state == "hidden" ? "visible" : "hidden" }
            states: [
                State {
                    name: "visible"
                    PropertyChanges {
                        target: form
                        systemButtonVisibility: false
                        clockVisibility: false
                    }
                    PropertyChanges {
                        target: virtualKeyboard
                        y: root.height - virtualKeyboard.height
                        opacity: 1
                    }
                },
                State {
                    name: "hidden"
                    PropertyChanges {
                        target: virtualKeyboard
                        y: root.height - root.height/4
                        opacity: 0
                    }
                }
            ]
            transitions: [
                Transition {
                    from: "hidden"
                    to: "visible"
                    SequentialAnimation {
                        ScriptAction {
                            script: {
                                virtualKeyboard.item.activated = true;
                                Qt.inputMethod.show();
                            }
                        }
                        ParallelAnimation {
                            NumberAnimation {
                                target: virtualKeyboard
                                property: "y"
                                duration: 100
                                easing.type: Easing.OutQuad
                            }
                            OpacityAnimator {
                                target: virtualKeyboard
                                duration: 100
                                easing.type: Easing.OutQuad
                            }
                        }
                    }
                },
                Transition {
                    from: "visible"
                    to: "hidden"
                    SequentialAnimation {
                        ParallelAnimation {
                            NumberAnimation {
                                target: virtualKeyboard
                                property: "y"
                                duration: 100
                                easing.type: Easing.InQuad
                            }
                            OpacityAnimator {
                                target: virtualKeyboard
                                duration: 100
                                easing.type: Easing.InQuad
                            }
                        }
                        ScriptAction {
                            script: {
                                Qt.inputMethod.hide();
                            }
                        }
                    }
                }
            ]
        }

        Image {
            id: backgroundImage

            height: parent.height
            width: config.HaveFormBackground == "true" && config.FormPosition != "center" && config.PartialBlur != "true" ? parent.width - formBackground.width : parent.width
            anchors.left: leftleft ||
                          leftcenter ?
                                formBackground.right : undefined

            anchors.right: rightright ||
                           rightcenter ?
                                formBackground.left : undefined

            horizontalAlignment: config.BackgroundImageAlignment == "left" ?
                                 Image.AlignLeft :
                                 config.BackgroundImageAlignment == "right" ?
                                 Image.AlignRight :
                                 config.BackgroundImageAlignment == "center" ?
                                 Image.AlignHCenter : undefined

            source: config.background || config.Background
            fillMode: config.ScaleImageCropped == "true" ? Image.PreserveAspectCrop : Image.PreserveAspectFit
            asynchronous: true
            cache: true
            clip: true
            mipmap: true
        }

        MouseArea {
            anchors.fill: backgroundImage
            onClicked: parent.forceActiveFocus()
        }
    }
}
EOF

sudo tee /usr/share/sddm/themes/sugar-dark/theme.conf > /dev/null <<EOF
[General]

Background="Background.jpg"
## Must match the name of the image in the theme directory. Any standard image file format is allowed with transparency supported. (e.g. background.jpeg/illustration.GIF/Foto.png)

ScaleImageCropped=true
## Whether the image should be cropped when scaled proportionally. Setting this to false will fit the whole image when scaled, possibly leaving white space. This can be exploited beautifully with illustrations. (Try it with "Illustration.svg")

ScreenWidth=1440
ScreenHeight=900
## Adjust to your resolution to help SDDM speed up on calculations



## [Design Customizations]

MainColor="navajowhite"
## Used for all elements when not focused/hovered etc. Usually the best effect is achieved by having this either white or a very light color

AccentColor="white"
## Used for elements in focus/hover/pressed. Should be contrasting to the background and the MainColor for best effect

RoundCorners=20
## Radius of the input fields and the login button. Empty for square. Can cause bad antialiasing of the fields.

ScreenPadding=0
## Increase or delete this to have a white padding all around your screen. This makes your image appear like a canvas. Cool!

Font="MartianMono Nerd Font"
## If you want to choose a custom font it will have to be available to the X root user. See https://wiki.archlinux.org/index.php/fonts#Manual_installation

FontSize=
## Only set a fixed value if fonts are way too small for your resolution. Preferrably kept empty.



## [Locale Settings]

Locale=
## The time and date locale should usually be set in your system settings. Only hard set this if something is not working by default or you want a seperate locale setting in your login screen.

HourFormat="HH:mm"
## Defaults to Locale.ShortFormat. Accepts "long" or a custom string like "hh:mm A". See http://doc.qt.io/qt-5/qml-qtqml-date.html

DateFormat="dddd, d of MMMM"
## Defaults to Locale.LongFormat. Accepts "short" or a custom string like "dddd, d 'of' MMMM". See http://doc.qt.io/qt-5/qml-qtqml-date.html



## [Interface Behavior]

ForceRightToLeft=true
## Revert the layout either because you would like the login to be on the right hand side or SDDM won't respect your language locale for some reason.

ForceLastUser=true
## Have the last user appear automatically in the username field.

ForcePasswordFocus=true
## Give automatic focus to the password field. Together with ForceLastUser this makes for the fastest login experience.

ForceHideCompletePassword=false
## If you don't like to see any character at all not even while being entered set this to true.

ForceHideVirtualKeyboardButton="false"
## Do not show the button for the virtual keyboard at all. This will completely disable functionality for the virtual keyboard even if it is installed and activated in sddm.conf


## [Translations]

## SDDM may lack proper translation for every element. Suger defaults to SDDM translations. Please help translate SDDM as much as possible for your language: https://github.com/sddm/sddm/wiki/Localization. These are in order as they appear on screen.

HeaderText=Howdy!\n
## Header can be empty to not display any greeting at all. Keep it short.

TranslatePlaceholderUsername=""
TranslatePlaceholderPassword=""
TranslateShowPassword=""
TranslateLogin="login"
TranslateLoginFailedWarning=""
TranslateCapslockWarning="Caps Lock!"
TranslateSession=""
TranslateSuspend=""
TranslateHibernate=""
TranslateReboot=""
TranslateShutdown=""
TranslateVirtualKeyboardButton=""
## These don't necessarily need to translate anything. You can enter whatever you want here.
EOF
