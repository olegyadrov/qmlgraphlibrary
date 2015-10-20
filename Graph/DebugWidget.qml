/****************************************************************************
**
** Copyright (c) 2015 Oleg Yadrov
**
** This software is provided 'as-is', without any express or implied
** warranty. In no event will the authors be held liable for any damages
** arising from the use of this software.
**
** Permission is granted to anyone to use this software for any purpose,
** including commercial applications, and to alter it and redistribute it
** freely, subject to the following restrictions:
**
** 1. The origin of this software must not be misrepresented; you must not
**    claim that you wrote the original software. If you use this software
**    in a product, an acknowledgement in the product documentation would be
**    appreciated but is not required.
** 2. Altered source versions must be plainly marked as such, and must not be
**    misrepresented as being the original software.
** 3. This notice may not be removed or altered from any source distribution.
**
****************************************************************************/

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: debugWidget

    implicitWidth: 240
    implicitHeight: 240

    property Scene scene

    ColumnLayout {
        anchors.fill: parent

        GroupBox {
            Layout.fillWidth: true
            title: "Selected Vertex"

            GridLayout {
                anchors.fill: parent
                columns: 2

                Label {
                    text: "ID"
                }
                TextField {
                    Layout.fillWidth: true
                    text: (scene.selectedVertex) ? scene.selectedVertex.vertexID : ""
                    readOnly: true
                    enabled: scene.selectedVertex
                }

                Label {
                    text: "X"
                }
                TextField {
                    Layout.fillWidth: true
                    text: (scene.selectedVertex) ? scene.selectedVertex.x : ""
                    readOnly: true
                    enabled: scene.selectedVertex
                }

                Label {
                    text: "Y"
                }
                TextField {
                    Layout.fillWidth: true
                    text: (scene.selectedVertex) ? scene.selectedVertex.y : ""
                    readOnly: true
                    enabled: scene.selectedVertex
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: "Selected Edge"

            GridLayout {
                anchors.fill: parent
                columns: 2

                Label {
                    text: "Vertex A"
                }
                TextField {
                    Layout.fillWidth: true
                    text: (scene.selectedEdge) ? scene.selectedEdge.vertexA.vertexID : ""
                    readOnly: true
                    enabled: scene.selectedEdge
                }

                Label {
                    text: "Vertex B"
                }
                TextField {
                    Layout.fillWidth: true
                    text: (scene.selectedEdge) ? scene.selectedEdge.vertexB.vertexID : ""
                    readOnly: true
                    enabled: scene.selectedEdge
                }

                Label {
                    text: "Length"
                }
                TextField {
                    Layout.fillWidth: true
                    text: (scene.selectedEdge) ? scene.selectedEdge.length.toFixed(2) : ""
                    readOnly: true
                    enabled: scene.selectedEdge
                }
            }
        }

        CheckBox {
            text: "Antialiasing"
            checked: scene.antialiasing
            onCheckedChanged:
                scene.antialiasing = checked
        }

        CheckBox{
            text: "Enabled"
            checked: scene.enabled
            onCheckedChanged:
                scene.enabled = checked
        }

        CheckBox {
            text: "Interactive"
            checked: scene.interactive
            onCheckedChanged:
                scene.interactive = checked
        }

        CheckBox {
            text: "Hover enabled"
            checked: scene.hoverEnabled
            onCheckedChanged:
                scene.hoverEnabled = checked
        }

        Button {
            text: "Print graph data"
            onClicked: {
                console.log(JSON.stringify(scene.getGraph(), null, 4))
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
