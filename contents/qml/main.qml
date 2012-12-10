import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents

Item {
    property int minimumHeight: column.childrenRect.height
    property int minimumWidth: column.childrenRect.width
    
    PlasmaCore.Theme {
      id: plasmaTheme
    }
    
    Timer {
        id: time
        property int year
        property int month
        property int day
        property int weekday
        property int hour
        property int minute

        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true

        function zeroPad(integer, size) {
            var s = integer.toString()
            if(s.length < size) {
                for(var i = s.length; i < size; ++i) {
                    s = "0" + s;
                }
            }
            return s;
        }

        function weekDayString(weekDayNumber) {
            var weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
            return weekdays[weekDayNumber];
        }

        onTriggered: {
            var date = new Date;
            year = date.getFullYear();
            month = date.getMonth() + 1;
            day = date.getDate();
            weekday = date.getDay();
            hour = date.getHours();
            minute = date.getMinutes();
        }
    }

    Column {
        id: column
        anchors.fill: parent

        Text {
            id: hourDisplay
            anchors.horizontalCenter: parent.horizontalCenter

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 24
            color: plasmaTheme.textColor

            text: time.zeroPad(time.hour, 2)
        }
        Text {
            id: minuteDisplay
            anchors.horizontalCenter: parent.horizontalCenter

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 24
            color: plasmaTheme.textColor

            text: time.zeroPad(time.minute, 2)
        }
        Text {
            id: dateDisplay
            anchors.horizontalCenter: parent.horizontalCenter

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
            color: plasmaTheme.textColor

            text: time.zeroPad(time.day, 2) + "." + time.zeroPad(time.month, 2) + "."
        }

    }
}
