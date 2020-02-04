import QtQuick 2.12
import QtQuick.Controls 2.5
ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: qsTr("Lol")


    Label {
        textFormat: Text.RichText
        text: "See the https://www.sostronk.com or maybe www.counter-strike.net/"
        onLinkActivated: Qt.openUrlExternally(link)
        font.pixelSize: 22
        MouseArea {
            anchors.fill: parent
            cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
            acceptedButtons: Qt.NoButton
        }
        // inspiration for MouseArea trick above: https://phabricator.kde.org/D19179
        Component.onCompleted: {
            function linkify(text) {
                var urlRegex= /(([a-z]+:\/\/)?(([a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel|local|internal))(:[0-9]{1,5})?(\/[a-z0-9_\-\.~]+)*(\/([a-z0-9_\-\.]*)(\?[a-z0-9+_\-\.%=&amp;]*)?)?(#[a-zA-Z0-9!$&'()*+.=-_~:@/?]*)?)(\s+|$)/gi;
                return text.replace(urlRegex, '<a href="$1">$1</a> ')
            }

            text = linkify(text)
        }
    }
}
