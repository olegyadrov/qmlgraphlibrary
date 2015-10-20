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
            property color scene: "#ffe0b2" // 100
            property color sceneBorder: "#ff9800" // 500

            property QtObject normal:
                QtObject {
                    property color vertex: "#c0ffb74d" // 300
                    property color vertexBorder: "#ff9800" // 500
                    property color edge: "#c0fb8c00" // 600
                }

            property QtObject hovered:
                QtObject {
                    property color vertex: "#c0ffa726" // 400
                    property color vertexBorder: "#ff9800" // 500
                    property color edge: "#f0fb8c00" // 600
                }

            property QtObject selected:
                QtObject {
                    property color vertex: "#f0ffa726" // 400
                    property color vertexBorder: "#ff9800" // 500
                    property color edge: "#fb8c00" // 600
                }

            property QtObject selectedAndHovered:
                QtObject {
                    property color vertex: "#ffa726" // 400
                    property color vertexBorder: "#ff9800" // 500
                    property color edge: "#f0fb8c00" // 600
                }
        }
}
