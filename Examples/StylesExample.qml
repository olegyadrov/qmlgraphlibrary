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
import "../Graph/Styles"

Item {
    id: stylesExample

    GridLayout {
        anchors.fill: parent
        anchors.margins: 10

        rows: 2
        columns: 2

        Graph.Scene {
            Layout.fillWidth: true
            Layout.fillHeight: true
            style: RedStyle {}

            Component.onCompleted: {
                setGraph(graph)
            }
        }

        Graph.Scene {
            Layout.fillWidth: true
            Layout.fillHeight: true
            style: GreenStyle {}

            Component.onCompleted: {
                setGraph(graph)
            }
        }

        Graph.Scene {
            Layout.fillWidth: true
            Layout.fillHeight: true
            style: OrangeStyle {}

            Component.onCompleted: {
                setGraph(graph)
            }
        }

        Graph.Scene {
            Layout.fillWidth: true
            Layout.fillHeight: true
            style: BlueStyle {}

            Component.onCompleted: {
                setGraph(graph)
            }
        }
    }
}
