/*
 * Copyright 2015 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import Lomiri.Components 1.3

Template {
    objectName: "lomiriShapesTemplate"

    TemplateSection {
        title: "Lomiri Shape"
        className: "LomiriShape"

        TemplateRow {
            title: i18n.tr("Aspect")
            titleWidth: units.gu(8)
            height: units.gu(8)

            LomiriShape {
                objectName: "lomirishape_aspect_inset"
                backgroundColor: LomiriColors.orange
                radius: "medium"
                aspect: LomiriShape.Inset
                Label {
                    anchors.centerIn: parent
                    text: "Inset"
                    textSize: Label.XSmall
                    color: theme.palette.normal.foregroundText
                }
            }

            LomiriShape {
                objectName: "lomirishape_aspect_dropshadow"
                backgroundColor: LomiriColors.orange
                radius: "medium"
                aspect: LomiriShape.DropShadow
                Label {
                    anchors.centerIn: parent
                    text: "DropShadow"
                    textSize: Label.XxSmall
                    color: theme.palette.normal.foregroundText
                }
            }

            LomiriShape {
                objectName: "lomirishape_aspect_flat"
                backgroundColor: LomiriColors.orange
                radius: "medium"
                aspect: LomiriShape.Flat
                Label {
                    anchors.centerIn: parent
                    text: "Flat"
                    textSize: Label.XxSmall
                    color: theme.palette.normal.foregroundText
                }
            }
        }

        TemplateRow {
            title: i18n.tr("Radius")
            titleWidth: units.gu(8)
            height: units.gu(8)

            LomiriShape {
                objectName: "lomirishape_radius_small"
                backgroundColor: theme.palette.normal.foreground
                radius: "small"
                Label {
                    anchors.centerIn: parent
                    text: "small"
                    textSize: Label.XxSmall
                    color: theme.palette.normal.foregroundText
                }
            }

            LomiriShape {
                objectName: "lomirishape_radius_medium"
                backgroundColor: theme.palette.normal.foreground
                radius: "medium"
                Label {
                    anchors.centerIn: parent
                    text: "medium"
                    textSize: Label.XxSmall
                    color: theme.palette.normal.foregroundText
                }
            }

            LomiriShape {
                objectName: "lomirishape_radius_medium"
                backgroundColor: theme.palette.normal.foreground
                radius: "large"
                Label {
                    anchors.centerIn: parent
                    text: "large"
                    textSize: Label.XxSmall
                    color: theme.palette.normal.foregroundText
                }
            }
        }

        TemplateRow {
            title: i18n.tr("Image")
            titleWidth: units.gu(8)
            height: units.gu(8)

            LomiriShape {
                objectName: "lomirishape_preserveaspectcrop"
                source: Image { source: "map_icon.png" }
                sourceFillMode: LomiriShape.PreserveAspectCrop
            }

            LomiriShape {
                objectName: "lomirishape_pad"
                backgroundColor: LomiriColors.warmGrey
                source: Image { source: "images.png" }
                sourceFillMode: LomiriShape.Pad
            }
        }

        TemplateRow {
            title: i18n.tr("Gradient")
            titleWidth: units.gu(8)
            height: units.gu(8)

            LomiriShape {
                objectName: "lomirishape_verticalgradient"
                backgroundColor: LomiriColors.lightAubergine
                secondaryBackgroundColor: Qt.rgba(
                    LomiriColors.lightAubergine.r, LomiriColors.lightAubergine.g,
                    LomiriColors.lightAubergine.b, 0.25)
                backgroundMode: LomiriShape.VerticalGradient
            }
        }
    }
}
