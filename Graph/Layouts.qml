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

QtObject {
    id: layouts

    property QtObject normal:
        QtObject {
            property double vertex: 1
            property double edge: 0.5
        }

    property QtObject hovered:
        QtObject {
            property double vertex: 2
            property double edge: 1.5
        }

    property QtObject selected:
        QtObject {
            property double vertex: 3
            property double edge: 2.5
        }

    property QtObject selectedAndHovered:
        QtObject {
            property double vertex: 4
            property double edge: 3.5
        }
}
