/*
    Copyright 2014 Canonical Ltd.
 *
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation; version 3.
 *
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.
 *
    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

pragma Singleton
import QtQuick 2.4

/*!
    \qmltype LomiriColors
    \inqmlmodule Lomiri.Components
    \ingroup lomiri
    \brief Singleton defining the Lomiri color palette.

    Each color of the Lomiri color palette is accesible from it.
    For more information on how to appropriately use the colors according to
    the context, please refer to the
    \l{http://design.lomiri.com/brand/colour-palette}{Lomiri brand guidelines}.

    Example of use:

    \qml
    Rectangle {
       color: LomiriColors.orange
    }
    \endqml
*/
QtObject {
    // old colors from LomiriColors 1.0:

    /*!
      Orange. Recommended for branded elements, display progress
      and intensity, textual links on light backgrounds.
    */
    readonly property color orange: "#DD4814"
    /*!
      \deprecated
      Lomiri supporting color: light aubergine
    */
    readonly property color lightAubergine: "#77216F"
    /*!
      \deprecated
      Lomiri supporting color: mid aubergine
    */
    readonly property color midAubergine: "#5E2750"
    /*!
      \deprecated
      Lomiri supporting color: dark aubergine
    */
    readonly property color darkAubergine: "#2C001E"
    /*!
      \deprecated
      Lomiri neutral color: warm grey
    */
    readonly property color warmGrey: "#AEA79F"
    /*!
      \deprecated
      Lomiri neutral color: cool grey
    */
    readonly property color coolGrey: "#333333"

    /*!
      Lomiri orange gradient

      \sa Button::gradient
    */
    property Gradient orangeGradient: Gradient {
        GradientStop { position: 0.0; color: "#DD4814" }
        GradientStop { position: 1.0; color: "#D9722D" }
    }
    /*!
      Lomiri grey gradient

      \sa Button::gradient
    */
    property Gradient greyGradient: Gradient {
        GradientStop { position: 0.0; color: "#888888" }
        GradientStop { position: 1.0; color: "#BBBBBB" }
    }

    // New colors introduced in LomiriColors 1.1:

    /*!
      Light grey. Recommended for neutral action buttons and
      secondary text.
      \since Lomiri.Components 1.1
     */
    readonly property color lightGrey: "#929292"

    /*!
      Dark grey. Recommended for text and action icons.
      \since Lomiri.Components 1.1
     */
    readonly property color darkGrey: "#5d5d5d"

    /*!
      Red. Recommended for negative and irreversible action
      buttons, errors and alerts.
      \since Lomiri.Components 1.1
     */
    readonly property color red: "#f32c36"

    /*!
      Green. Recommended for positive action buttons.
      \since Lomiri.Components 1.1
     */
    readonly property color green: "#00a132"

    /*!
      Blue. Recommended for text selection and text cursor.
      \since Lomiri.Components 1.1
     */
    readonly property color blue: "#12a3d8"

    /*!
      Purple. Recommended for proper nouns in
      list items.
      \since Lomiri.Components 1.1
     */
    readonly property color purple: "#762572"
}
