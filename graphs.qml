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
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import "Examples"

ApplicationWindow {
    title: "QML Graph Library"
    width: 800
    height: 600

    property var graph: {
        "vertices": [
            { id: 0, x: 150, y: 50 },
            { id: 1, x: 100, y: 120 },
            { id: 2, x: 50, y: 190 },
            { id: 3, x: 200, y: 120 },
            { id: 4, x: 250, y: 190 },
            { id: 5, x: 150, y: 190 }
        ],
        "edges": [
            { vertexA: 0, vertexB: 1 },
            { vertexA: 1, vertexB: 2 },
            { vertexA: 0, vertexB: 3 },
            { vertexA: 3, vertexB: 4 },
            { vertexA: 1, vertexB: 5 }
        ]
    }

    TabView {
        anchors.fill: parent

        Tab {
            title: "Interaction example"

            InteractionExample {}
        }

        Tab {
            title: "Styles example"

            StylesExample {}
        }

        Tab {
            title: "Dynamic creation example"

            DynamicCreationExample {}
        }

        Tab {
            title: "About"

            About {}
        }
    }
}
