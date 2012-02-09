//import QtQuick 1.0
import Qt 4.7

Item {
    id: keyboard
    width: 1024
    height: 406

    property variant queryString: ""

    function chewing(s) {
        queryString += s;
        console.log('queryString: '+queryString); 
        if (Keyboard.queryChewing(queryString)) {
            candidate.text = Keyboard.queryChewing(queryString);
            queryString = "";
        }
    }

    SequentialAnimation {
        id: show
        PropertyAnimation { target: keyboard; properties: "height"; to: "406"; duration: 50; easing.type: Easing.InOutQuad; }
        PropertyAnimation { target: keyboard; properties: "y"; to: "0"; }
    }
    SequentialAnimation {
         id: hide
         PropertyAnimation { target: keyboard; properties: "y"; to: "352"; duration: 400; easing.type: Easing.InOutQuad; }
         PropertyAnimation { target: keyboard; properties: "height"; to: "0"; }
     }

    function toggle() {
        if (keyboard.y == 406) show.start();
        else hide.start();
    }
    function focusin() { show.start(); }
    function focusout() { hide.start(); }

    Rectangle {
        id: layout_default
        color: "transparent"

        Image {
            source: ":asset/keyboard-bpmf.png"

        Text { 
            id: candidate 
            x: 2; y: 0; 
            width: 1020
            height: 55
            font.pixelSize: 48
            text: ""
        }

            Button {
                x: 7; y: 60; height: 60; width: 75
                onClicked: chewing("1")
            }
            Button {
                x: 92; y: 60; height: 60; width: 75
                onClicked: chewing("2")
            }
            Button {
                x: 177; y: 60; height: 60; width: 75
                onClicked: chewing("3")
            }
            Button {
                x: 262; y: 60; height: 60; width: 75
                onClicked: chewing("4")
            }
            Button {
                x: 347; y: 60; height: 60; width: 75
                onClicked: chewing("5")
            }
            Button {
                x: 432; y: 60; height: 60; width: 75
                onClicked: chewing("6")
            }
            Button {
                x: 517; y: 60; height: 60; width: 75
                onClicked: chewing("7")
            }
            Button {
                x: 602; y: 60; height: 60; width: 75
                onClicked: chewing("8")
            }
            Button {
                x: 687; y: 60; height: 60; width: 75
                onClicked: chewing("9")
            }
            Button {
                x: 772; y: 60; height: 60; width: 75
                onClicked: chewing("0")
            }
            Button {
                x: 857; y: 60; height: 60; width: 75
                onClicked: chewing("-")
            }
            Button {
                x: 942; y: 60; height: 60; width: 75
                onClicked: { Keyboard.sendKey(":backspace"); 
                    queryString = ""; candidate.text = ""; }
            }

    // second row
            Button {
                x: 27; y: 129; height: 60; width: 75
                onClicked: chewing("q")
            }
            Button {
                x: 112; y: 129; height: 60; width: 75
                onClicked: chewing("w")
            }
            Button {
                x: 197; y: 129; height: 60; width: 75
                onClicked: chewing("e")
            }
            Button {
                x: 282; y: 129; height: 60; width: 75
                onClicked: chewing("r")
            }
            Button {
                x: 367; y: 129; height: 60; width: 75
                onClicked: chewing("t")
            }
            Button {
                x: 450; y: 129; height: 60; width: 75
                onClicked: chewing("y")
            }
            Button {
                x: 532; y: 129; height: 60; width: 75
                onClicked: chewing("u")
            }
            Button {
                x: 615; y: 129; height: 60; width: 75
                onClicked: chewing("i")
            }
            Button {
                x: 698; y: 129; height: 60; width: 75
                onClicked: chewing("o")
            }
            Button {
                x: 781; y: 129; height: 60; width: 75
                onClicked: chewing("p")
            }
            Button {
                x: 864; y: 129; height: 60; width: 75
                onClicked: Keyboard.sendKey("、")
            }
            Button {
                x: 944; y: 129; height: 60; width: 75
                onClicked: Keyboard.sendKey("，")
            }

// third row
            Button {
                x: 49; y: 198; height: 75; width: 146
                onClicked: chewing("a") 
            }
            Button {
                x: 134; y: 198; height: 60; width: 75
                onClicked: chewing("s")
            }
            Button {
                x: 219; y: 198; height: 60; width: 75
                onClicked: chewing("d")
            }
            Button {
                x: 304; y: 198; height: 60; width: 75
                onClicked: chewing("f")
            }
            Button {
                x: 389; y: 198; height: 60; width: 75
                onClicked: chewing("g")
            }
            Button {
                x: 474; y: 198; height: 60; width: 75
                onClicked: chewing("h")
            }
            Button {
                x: 559; y: 198; height: 60; width: 75
                onClicked: chewing("j")
            }
            Button {
                x: 644; y: 198; height: 60; width: 75
                onClicked: chewing("k")
            }
            Button {
                x: 729; y: 198; height: 60; width: 75
                onClicked: chewing("l")
            }
            Button {
                x: 814; y: 198; height: 60; width: 75
                onClicked: chewing(";")
            }
            Button {
                x: 900; y: 198; height: 75; width: 107
                type: "return"
                onClicked: { Keyboard.sendKey(":enter"); 
                    queryString = ""; candidate.text = ""; }
            }

// forth row

            Button {
                x: 7; y: 267; height: 60; width: 75
                onClicked: chewing(" ")
            }
            Button {
                x: 92; y: 267; height: 60; width: 75
                onClicked: chewing("z")
            }
            Button {
                x: 177; y: 267; height: 60; width: 75
                onClicked: chewing("x")
            }
            Button {
                x: 262; y: 267; height: 60; width: 75
                onClicked: chewing("c")
            }
            Button {
                x: 347; y: 267; height: 60; width: 75
                onClicked: chewing("v")
            }
            Button {
                x: 432; y: 267; height: 60; width: 75
                onClicked: chewing("b")
            }
            Button {
                x: 517; y: 267; height: 60; width: 75
                onClicked: chewing("n")
            }
            Button {
                x: 602; y: 267; height: 60; width: 75
                onClicked: chewing("m")
            }
            Button {
                x: 687; y: 267; height: 60; width: 75
                onClicked: chewing(",")
            }
            Button {
                x: 772; y: 267; height: 60; width: 75
                onClicked: chewing(".")
            }
            Button {
                x: 857; y: 267; height: 60; width: 75
                onClicked: chewing("/")
            }
            Button {
                x: 944; y: 267; height: 60; width: 75
                onClicked: Keyboard.sendKey("。")
            }

// fifth row

            Button {
                type: "space"
                x: 278; y: 337; height: 60; width: 441
                onClicked: chewing(" ")
            }

            Button {
                x: 942; y: 337; height: 60; width: 196
                onClicked: chewing(":hide")
            }

        }
    }

}
