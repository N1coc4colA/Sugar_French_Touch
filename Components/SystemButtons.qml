//
//This is a part of Sugar: French Touch
// Created by n1coc4cola@gmail.com
// and n1coc4cola-official on open-desktop.org
//
//This the is based on Sugar-Dark
//Credits of the original version:
//
//            |||
//          __|||__
//          \\\|///
//           \\|//
//            \|/
//
// This file is part of Sugar Dark, a theme for the Simple Display Desktop Manager.
//
// Copyright 2018 Nicolas Badin
//
// Sugar Dark and Sugar French Touch are free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Sugar Dark and Sugar French Touch are distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Sugar Dark or/and Sugar French Touch. If not, see <https://www.gnu.org/licenses/>.
//

import QtQuick 2.10
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.3

RowLayout {

    spacing: root.font.pointSize

    property var suspend: ["Suspend", config.TranslateSuspend || textConstants.suspend, sddm.canSuspend]
    property var reboot: ["Reboot", config.TranslateReboot || textConstants.reboot, sddm.canReboot]
    property var shutdown: ["Shutdown", config.TranslateShutdown || textConstants.shutdown, sddm.canPowerOff]

    property Control exposedLogin

    Repeater {

        model: [suspend, reboot, shutdown]

        RoundButton {
            enabled: modelData[2]
            text: modelData[1]
            font.pointSize: root.font.pointSize * 0.8
            Layout.alignment: Qt.AlignHCenter
            icon.source: modelData ? Qt.resolvedUrl("../Assets/" + modelData[0] + ".svgz") : ""
            icon.height: 2 * Math.round((root.font.pointSize * 3) / 2)
            icon.width: 2 * Math.round((root.font.pointSize * 3) / 2)
            display: AbstractButton.TextUnderIcon
            opacity: modelData[2] ? 1 : 0.3
            hoverEnabled: true
            palette.buttonText: root.palette.text
            background: Rectangle {
                height: 2
                color: "transparent"
                width: parent.width
                border.width: parent.visualFocus ? 1 : 0
                border.color: "transparent"
                anchors.top: parent.bottom
            }
            Keys.onReturnPressed: clicked()
            onClicked: {
                parent.forceActiveFocus()
                index == 0 ? sddm.suspend() : index == 1 ? sddm.reboot() : sddm.powerOff()
            }
            KeyNavigation.up: exposedLogin
            KeyNavigation.left: index == 0 ? exposedLogin : parent.children[index-1]

            states: [
                State {
                    name: "pressed"
                    when: parent.children[index].down
                    PropertyChanges {
                        target: parent.children[index]
                        palette.buttonText: Qt.lighter("cyan", 1.1)
                    }
                    PropertyChanges {
                        target: parent.children[index].background
                        border.color: Qt.lighter("cyan", 1.3)
                    }
                },
                State {
                    name: "hovered"
                    when: parent.children[index].hovered
                    PropertyChanges {
                        target: parent.children[index]
                        palette.buttonText: Qt.lighter("cyan", 1.5)
                    }
                    PropertyChanges {
                        target: parent.children[index].background
                        border.color: Qt.lighter("cyan", 1.7)
                    }
                },
                State {
                    name: "focused"
                    when: parent.children[index].visualFocus
                    PropertyChanges {
                        target: parent.children[index]
                        palette.buttonText: Qt.lighter("cyan", 1.3)
                    }
                    PropertyChanges {
                        target: parent.children[index].background
                        border.color: Qt.lighter("cyan", 1.5)
                    }
                }
            ]

            transitions: [
                Transition {
                    PropertyAnimation {
                        properties: "palette.buttonText, border.color"
                        duration: 150
                    }
                }
            ]

        }

    }

}
