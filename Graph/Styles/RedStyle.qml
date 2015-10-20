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
import "../../Graph" as Graph

Graph.Style {
    // https://www.google.com/design/spec/style/color.html#color-color-palette
    colors:
        QtObject {
            property color scene: "#ffcdd2" // 100
            property color sceneBorder: "#f44336" // 500

            property QtObject normal:
                QtObject {
                    property color vertex: "#c0e57373" // 300
                    property color vertexBorder: "#f44336" // 500
                    property color edge: "#c0e53935" // 600
                }

            property QtObject hovered:
                QtObject {
                    property color vertex: "#c0ef5350" // 400
                    property color vertexBorder: "#f44336" // 500
                    property color edge: "#f0e53935" // 600
                }

            property QtObject selected:
                QtObject {
                    property color vertex: "#f0ef5350" // 400
                    property color vertexBorder: "#f44336" // 500
                    property color edge: "#e53935" // 600
                }

            property QtObject selectedAndHovered:
                QtObject {
                    property color vertex: "#ef5350" // 400
                    property color vertexBorder: "#f44336" // 500
                    property color edge: "#f0e53935" // 600
                }
        }
}
