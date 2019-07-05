//
//This is a part of Sugar: French Touch
// Created by n1coc4cola@gmail.com
// and n1coc4cola-official on open-desktop.org
//
//This the is based on Sugar-Dark
//Credits of the original version:
//
//             |||
//         __|||__
//          \\\|///
//           \\|//
//            \|/
//
// This file is part of Sugar Light, a theme for the Simple Display Desktop Manager.
//
// Copyright 2018 Marian Arlt
//
// Sugar Light is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Sugar Light is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Sugar Light. If not, see <https://www.gnu.org/licenses/>.
//
//

import QtQuick 2.10
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.3
import "Components"

//Base of the screen, it's THE window

Pane{
    id: root

    height: config.ScreenHeight
    width: config.ScreenWidth
    padding: config.ScreenPadding || root.padding

    LayoutMirroring.enabled: config.ForceRightToLeft == "true" ? true : Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    palette.button: "transparent"
    palette.highlight: config.ThemeColor
    palette.text: config.ThemeColor
    palette.buttonText: config.ThemeColor

    font.family: config.Font
    font.pointSize: config.FontSize !== "" ? config.FontSize : parseInt(height / 80)
    focus: true

// Main Container

    RowLayout {
        anchors.fill: parent
        spacing: 0
	Layout.maximumWidth: parent.width / 5

// Right or Left window withe connection form

        LoginForm {
            Layout.minimumHeight: parent.height
            Layout.maximumWidth: parent.width / 5
        }

//Define the Background and in the Background there is the Clock

        Item {
            id: image
            Layout.fillWidth: true
            Layout.fillHeight: true
            Image {
                source: config.background || config.Background
                anchors.fill: parent
                asynchronous: true
                cache: true
                fillMode: config.ScaleImageCropped == "true" ? Image.PreserveAspectCrop : Image.PreserveAspectFit
                clip: true
                mipmap: true

//Clock container with some transparent rectangles for the Layout of the Clock

        Row {
            anchors.fill: parent
            //visible: primaryScreen

//    ----------DANGER--------------
//Bug in the division settings: you can set a " . " in your number for " / " or a bug happen: the Clock Disapear
// This is a bug of temporary files if you test this theme with the terminal. Be careful, you can keep the temporary files with the extension " *.qmlc "
//You must delete them regulary, if no, you can have this bug (like me) but it's bad when you do some tests

            Rectangle {
		color: "transparent"
                width: parent.width / 3; height: parent.height

            Rectangle {
		color: "transparent"
                width: parent.width; height: parent.height
                }
	    }

            Rectangle {
		color: "transparent"
                width: parent.width / 3.5; height: parent.height

            Rectangle {
		color: "transparent"
                width: parent.width; height: parent.height
                }
	    }

            Rectangle {
		color: "transparent"
                width: parent.width / 2; height: parent.height
            Rectangle {
		color: "transparent"
                width: parent.width / 1; height: parent.height
                }
            Rectangle {
		color: "transparent"
                width: parent.width / 1; height: parent.height
                }

//The Container OF the Clock Container

                TimeDate {
                    id: clock
                    anchors.centerIn: parent
                }
            }
	}

//This Row is not visible but used in the Layout of the Clock

   			 RowLayout {
      			  spacing: 0
			   Layout.maximumWidth: parent.width
			   Layout.maximumHeight: parent.height
            Rectangle {
		color: "transparent"
                width: parent.width / 2; height: parent.height
                }

     			       }
        	    MouseArea {
         	       anchors.fill: parent
       		       onClicked: parent.forceActiveFocus()
		}
            }
        }
    }

}
