import QtQuick 2.9

import "../components" as WaznComponents

TextEdit {
    color: WaznComponents.Style.defaultFontColor
    font.family: WaznComponents.Style.fontRegular.name
    selectionColor: WaznComponents.Style.textSelectionColor
    wrapMode: Text.Wrap
    readOnly: true
    selectByMouse: true
    // Workaround for https://bugreports.qt.io/browse/QTBUG-50587
    onFocusChanged: {
        if(focus === false)
            deselect()
    }
}
