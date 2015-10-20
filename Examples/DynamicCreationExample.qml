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
import "../Graph" as Graph

Item {
    id: interactionExample

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        TextArea {
            id: textArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: JSON.stringify(graph, null, 4)
            readOnly: true
        }

        RowLayout {
            Item {
                Layout.fillWidth: true
            }

            Button {
                text: "/\\"
                onClicked: {
                    var graph = sceneA.getGraph()
                    if (graph.vertices.length > 0)
                        textArea.text = JSON.stringify(graph, null, 4)
                }
            }
            Button {
                text: "\\/"
                onClicked:
                    sceneA.setGraph(JSON.parse(textArea.text))
            }

            Item {
                Layout.fillWidth: true
            }

            Button {
                text: "/\\"
                onClicked: {
                    var graph = sceneB.getGraph()
                    if (graph.vertices.length > 0)
                        textArea.text = JSON.stringify(graph, null, 4)
                }
            }
            Button {
                text: "\\/"
                onClicked:
                    sceneB.setGraph(JSON.parse(textArea.text))
            }

            Item {
                Layout.fillWidth: true
            }
        }

        RowLayout {
            Graph.Scene {
                id: sceneA

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Graph.Scene {
                id: sceneB

                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
