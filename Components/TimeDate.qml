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

//Clock Container

ColumnLayout {
    id: containertimedate

//This area is for the Layout.
// If you delete the area of " Transparentpanel ", the Clock go to the Top.
//Transparentpanel is used for make the Clock at the Bottom.

	Transparentpanel {
	    id: blankp
            Layout.minimumHeight: parent.height * 2.5
        }

	Clock {
	    id: blankpb
            Layout.minimumWidth: parent.width / 2
            Layout.maximumWidth: parent.width
	    Layout.preferredWidth: parent.width
        }
}
