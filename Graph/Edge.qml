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

Item {
    id: edge

    x: (vertexA.centerX + vertexB.centerX) / 2 - width / 2
    y: (vertexA.centerY + vertexB.centerY) / 2 - height / 2

    width: Math.sqrt(Math.pow(vertexA.centerX - vertexB.centerX, 2) +
                     Math.pow(vertexA.centerY - vertexB.centerY, 2))
    height: scene.style.geometry.edgeSize
    rotation: Math.atan2(vertexB.centerY - vertexA.centerY, vertexB.centerX - vertexA.centerX) * 180 / Math.PI

    property string edgeID
    property Item vertexA
    property Item vertexB
    property Item scene

    readonly property alias length: edge.width
    readonly property string type: "edge"
    readonly property bool hovered: scene.hoverEnabled && mouseArea.containsMouse
    readonly property bool selected: scene.selectedEdge === edge

    Component.onCompleted: {
        if (!scene)
            scene = parent
    }

    Rectangle {
        anchors.fill: parent

        color: {
            if (selected && hovered)
                scene.style.colors.selectedAndHovered.edge
            else if (selected)
                scene.style.colors.selected.edge
            else if (hovered)
                scene.style.colors.hovered.edge
            else
                scene.style.colors.normal.edge
        }

        antialiasing: scene.antialiasing
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: scene.hoverEnabled

        onPressed: {
            scene.selectedEdge = edge
        }
    }
}
