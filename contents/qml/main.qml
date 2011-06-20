import Qt 4.7
import org.kde.plasma.graphicswidgets 0.1 as PlasmaWidgets

Item {
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
            month = date.getMonth();
            day = date.getDate();
            weekday = date.getDay();
            hour = date.getHours();
            minute = date.getMinutes();
        }
    }

    Column {
        anchors.fill: parent

        Text {
            id: hourDisplay
            anchors.horizontalCenter: parent.horizontalCenter

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 24
            color: "#eee"

            text: time.zeroPad(time.hour, 2)
        }
        Text {
            id: minuteDisplay
            anchors.horizontalCenter: parent.horizontalCenter

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 24
            color: "#eee"

            text: time.zeroPad(time.minute, 2)
        }
        Text {
            id: dateDisplay
            anchors.horizontalCenter: parent.horizontalCenter

            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
            color: "#eee"

            text: time.zeroPad(time.day, 2) + "." + time.zeroPad(time.month, 2) + "."
        }

    }
}
