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

Item {
    id: about

    TextArea {
        id: textEdit
        anchors.fill: parent
        anchors.margins: 10
        textFormat: TextEdit.RichText
        wrapMode: TextEdit.Wrap
        readOnly: true
        onLinkActivated: Qt.openUrlExternally(link)
        text: "<b>QML Graph Library 1.0.0</b><br><br>

               Copyright (c) 2015 <a href=\"https://linkedin.com/in/olegyadrov/\">Oleg Yadrov</a><br><br>

               This software is provided 'as-is', without any express or implied<br>
               warranty. In no event will the authors be held liable for any damages<br>
               arising from the use of this software.<br><br>

               Permission is granted to anyone to use this software for any purpose,<br>
               including commercial applications, and to alter it and redistribute it<br>
               freely, subject to the following restrictions:<br><br>

               1. The origin of this software must not be misrepresented; you must not<br>
                  claim that you wrote the original software. If you use this software<br>
                  in a product, an acknowledgement in the product documentation would be<br>
                  appreciated but is not required.<br>
               2. Altered source versions must be plainly marked as such, and must not be<br>
                  misrepresented as being the original software.<br>
               3. This notice may not be removed or altered from any source distribution."

        MouseArea {
            anchors.fill: parent
            cursorShape: textEdit.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
            acceptedButtons: Qt.NoButton
        }
    }
}

