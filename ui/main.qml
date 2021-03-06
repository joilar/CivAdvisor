/* Copyright (C) 2014  John Oilar
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
        Menu {
            title: qsTr("Civ")
            MenuItem {
                text: qsTr("&Basic")
                onTriggered: console.log("Basic Civ selected.");
            }
            MenuItem {
                text: qsTr("&Advanced")
                onTriggered: console.log("Advanced Civ selected.");
            }
        }
    }

    RowLayout {
        id: layout
        anchors.fill: parent
        anchors.margins: 4
        spacing: 4

        Rectangle {
            color: "pink"
            Layout.fillHeight: true
            Layout.fillWidth: true
            ListView {
                id: advanceListView
                anchors.fill: parent
                model: advanceListModel
                delegate: Button {
                    property var advance: model.modelData

                    width: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    action: advanceAction

                    Text {
                        text: advance.name
                        anchors.centerIn: parent
                        renderType: Text.NativeRendering
                    }
                }

                Component.onCompleted: advanceAction.trigger(currentItem)
            }
        }

        Rectangle {
            id: detailsPane
            property var advance : QtObject {
                property string name
                property string value
                property string text
            }

            color: "lightgreen"
            Layout.fillHeight: true
            Layout.fillWidth: true

            Column {
                anchors.fill: parent
                spacing: 4

                Text {
                    text: "Name: " + detailsPane.advance.name
                    renderType: Text.NativeRendering
                }

                Text {
                    text: "Value: " + detailsPane.advance.value
                    renderType: Text.NativeRendering
                }

                Text {
                    width: parent.width
                    text: "Text: " + detailsPane.advance.text
                    renderType: Text.NativeRendering
                    wrapMode: Text.Wrap
                }
            }
        }
    }

    Action {
        id: advanceAction
        onTriggered: detailsPane.advance = source.advance
    }
}
