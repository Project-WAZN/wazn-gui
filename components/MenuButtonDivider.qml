import QtQuick 2.9

import "." as WaznComponents
import "effects/" as WaznEffects

Rectangle {
    color: WaznComponents.Style.appWindowBorderColor
    height: 1

    WaznEffects.ColorTransition {
        targetObj: parent
        blackColor: WaznComponents.Style._b_appWindowBorderColor
        whiteColor: WaznComponents.Style._w_appWindowBorderColor
    }
}
