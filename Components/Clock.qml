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
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.2
import SddmComponents 2.0 as SDDM

Column {
    id: clock
    spacing: 8
    width: parent.width * 1.75
	    anchors.right: root.right
	    anchors.bottom: root.bottom
    height: parent.height
	LayoutMirroring.enabled: config.ForceRightToLeft == "true" ? true : Qt.application.layoutDirection === Qt.LeftToRight

    Label {
        id: timeLabel
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: root.font.pointSize * 8
        color: "white"
        renderType: Text.QtRendering
        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(config.Locale), config.HourFormat == "long" ? Locale.LongFormat : config.HourFormat !== "" ? config.HourFormat : Locale.ShortFormat)
        }
    }

    Label {
        id: dateLabel
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
	font.pointSize: root.font.pointSize * 2
        renderType: Text.QtRendering
        function updateTime() {
            text = new Date().toLocaleDateString(Qt.locale(config.Locale), config.DateFormat == "short" ? Locale.ShortFormat : config.DateFormat !== "" ? config.DateFormat : Locale.LongFormat)
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            dateLabel.updateTime()
            timeLabel.updateTime()
        }
    }

    Component.onCompleted: {
        dateLabel.updateTime()
        timeLabel.updateTime()
    }

//  ----------DANGER--------------
//Don't delete this area or the Clock Disapear

    RowLayout {
        anchors.fill: parent
        spacing: 0
	Layout.maximumWidth: parent.width / 0.5

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
            }
            MouseArea {
                anchors.fill: parent
                onClicked: parent.forceActiveFocus()
            }
        }
     }
}
