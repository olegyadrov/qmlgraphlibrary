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
    id: vertex

    width: scene.style.geometry.vertexSize
    height: scene.style.geometry.vertexSize

    readonly property double centerX: x + scene.style.geometry.vertexSize / 2
    readonly property double centerY: y + scene.style.geometry.vertexSize / 2

    property string vertexID
    property Item scene

    readonly property string type: "vertex"
    readonly property bool hovered: scene.hoverEnabled && mouseArea.containsMouse
    readonly property bool selected: scene.selectedVertex === vertex

    z: {
        if (selected && hovered)
            scene.layouts.selectedAndHovered.vertex
        else if (selected)
            scene.layouts.selected.vertex
        else if (hovered)
            scene.layouts.hovered.vertex
        else
            scene.layouts.normal.vertex
    }

    Component.onCompleted: {
        if (!scene)
            scene = parent
    }

    Rectangle {
        anchors.fill: parent

        radius: width / 2

        color: {
            if (selected && hovered)
                scene.style.colors.selectedAndHovered.vertex
            else if (selected)
                scene.style.colors.selected.vertex
            else if (hovered)
                scene.style.colors.hovered.vertex
            else
                scene.style.colors.normal.vertex
        }

        border.color: {
            if (selected && hovered)
                scene.style.colors.selectedAndHovered.vertexBorder
            else if (selected)
                scene.style.colors.selected.vertexBorder
            else if (hovered)
                scene.style.colors.hovered.vertexBorder
            else
                scene.style.colors.normal.vertexBorder
        }

        border.width: scene.style.geometry.vertexBorderSize

        antialiasing: scene.antialiasing
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        drag.target: scene.interactive ? vertex : null
        drag.minimumX: 1
        drag.maximumX: scene.width - width -1
        drag.minimumY: 1
        drag.maximumY: scene.height - height - 1
        drag.threshold: 0.0
        drag.smoothed: false

        hoverEnabled: scene.hoverEnabled

        onPressed: {
            scene.selectedVertex = vertex
        }
    }
}
