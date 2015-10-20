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
import "ArrayManager.js" as ArrayManager

Item {
    id: scene

    implicitWidth: 320
    implicitHeight: 240

    clip: true
    antialiasing: true

    property Layouts layouts: Layouts {}
    property Style style: Style {}

    property Item selectedVertex
    property Item selectedEdge
    property bool interactive: true
    property bool hoverEnabled: true

    property string verticesArrayID: "vertices"
    property string edgesArrayID: "edges"

    property Component vertexComponent: Qt.createComponent("Vertex.qml")
    property Component edgeComponent: Qt.createComponent("Edge.qml")

    Rectangle {
        anchors.fill: parent
        color: style.colors.scene
        border.width: 1
        border.color: style.colors.sceneBorder
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            selectedVertex = null
            selectedEdge = null
        }
    }

    function clear() {
        if (ArrayManager.arrayExists(edgesArrayID))
        {
            var edgesArray = ArrayManager.getArray(edgesArrayID)
            for (var edgeID in edgesArray)
                edgesArray[edgeID].destroy()
            ArrayManager.clearArray(edgesArrayID)
        }

        if (ArrayManager.arrayExists(verticesArrayID))
        {
            var verticesArray = ArrayManager.getArray(verticesArrayID)
            for (var vertexID in verticesArray)
                verticesArray[vertexID].destroy()
            ArrayManager.clearArray(verticesArrayID)
        }
    }

    function setGraph(graph) {
        clear()

        var verticesArray = ArrayManager.createArray(verticesArrayID)
        for (var i = 0; i < graph.vertices.length; i++)
        {
            var vertexData = graph.vertices[i]
            var newVertex = vertexComponent.createObject(scene, {
                x: vertexData.x,
                y: vertexData.y,
                vertexID: vertexData.id
            })
            verticesArray[vertexData.id] = newVertex
        }

        var edgesArray = ArrayManager.createArray(edgesArrayID)
        for (i = 0; i < graph.edges.length; i++)
        {
            var edgeData = graph.edges[i]
            var newEdge = edgeComponent.createObject(scene, {
                vertexA: verticesArray[edgeData.vertexA],
                vertexB: verticesArray[edgeData.vertexB]
            })
            edgesArray.push(newEdge)
        }
    }

    function getGraph() {
        var verticesOutputArray = []
        if (ArrayManager.arrayExists(verticesArrayID))
        {
            var verticesArray = ArrayManager.getArray(verticesArrayID)
            for (var i = 0; i < verticesArray.length; i++) {
                var vertex = verticesArray[i]

                verticesOutputArray.push({
                    id: vertex.vertexID,
                    x: vertex.x,
                    y: vertex.y
                })
            }
        }

        var edgesOutputArray = []
        if (ArrayManager.arrayExists(edgesArrayID))
        {
            var edgesArray = ArrayManager.getArray(edgesArrayID)
            for (i = 0; i < edgesArray.length; i++) {
                var edge = edgesArray[i]
                edgesOutputArray.push({
                    vertexA: edge.vertexA.vertexID,
                    vertexB: edge.vertexB.vertexID
                })
            }
        }

        var jsonData = {
            vertices: verticesOutputArray,
            edges: edgesOutputArray
        }

        return jsonData
    }
}
