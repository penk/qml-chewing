import QtQuick 2.0

Item {
    id: button
    signal clicked()
    property string type: "default"

    Image {
        id: shadow
        source: (type == "default") ? "asset/pressed.png" : "asset/pressed-"+type+".png"
        z: 1.1
        opacity: 0
        anchors.left: parent.left
        anchors.top: parent.top
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: { button.clicked(); }
        onPressed: PropertyAnimation { target: shadow; properties: "opacity"; to: "0.8"; duration: 5 }
        onReleased: PropertyAnimation { target: shadow; properties: "opacity"; to: "0"; duration: 5 }
    }
}
