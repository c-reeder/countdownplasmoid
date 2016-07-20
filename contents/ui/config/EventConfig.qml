import QtQuick 2.0
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.calendar 2.0 as PlasmaCalendar
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.configuration 2.0 as PlasmaConfiguration

import ".."
// import "../../code/utils.js" as Utils

Item {
    id: timePage
    property alias calendar_date: dateChooser.selectedDate;
    property alias selected_title: titleField.text;
    property alias selected_hours: hrsChooser.value;
    property alias selected_mins: minsChooser.value;
    property alias selected_secs: secsChooser.value;
    property variant okay_button:  (parent.parent.parent.parent.parent.parent.parent.parent.parent.parent.children[1].children[0]);

    Component.onCompleted: {
         //cfg_exampleBool = true
	 var event = new Date(Number(plasmoid.configuration.eventMoment));
	 function saveConfig() {
		 print("Saving Config....");
		 //plasmoid.configuration.eventMoment = 
	 }
	 okay_button.clicked.connect(saveConfig);
	 calendar_date = event;
	 selected_hours = event.getHours();
	 selected_mins = event.getMinutes();
	 selected_secs = event.getSeconds();
	 print("checking: " + okay_button.text);
    }
//    okay_button.onClicked: {
//	print("THIS IS SO TASSSSTTYYYYY");
//    }

    ColumnLayout {
   	Text {
            text: i18n("Title")
        }
        TextField {
            id: titleField 
            placeholderText: i18n("Title")
       }
       Calendar {
	    id: dateChooser
       }
       RowLayout {
	       SpinBox {
			id: hrsChooser
			maximumValue: 23
		}
		Text {
			text: ":"
		}
	       SpinBox {
			id: minsChooser
			maximumValue: 60
		}
		Text {
			text: ":"
		}

	       SpinBox {
			id: secsChooser
			maximumValue: 60
		}
		Text {
			text: " "
		}
		SpinBox {
			id: tzChooser

		}
       }

    }
}
