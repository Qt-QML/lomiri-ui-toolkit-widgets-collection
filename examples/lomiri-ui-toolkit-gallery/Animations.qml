/*
 * Copyright 2013 Canonical Ltd.
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

import QtQuick 2.0
import Lomiri.Components 1.3

Template {
    objectName: "animationsTemplate"

    TemplateSection {
        title: i18n.tr("NumberAnimation")
        className: "LomiriNumberAnimation"

        TemplateRow {
            title: i18n.tr("Standard")

            Item {
                width: units.gu(14)
                height: units.gu(14)

                AnimationCircle {
                    radius: units.gu(6)
                    anchors.centerIn: parent

                    SequentialAnimation on radius {
                        loops: Animation.Infinite
                        PauseAnimation {
                            duration: 1000
                        }
                        LomiriNumberAnimation {
                            from: units.gu(6)
                            to: units.gu(12)
                        }
                        LomiriNumberAnimation {
                            from: units.gu(12)
                            to: units.gu(6)
                        }
                    }
                }
            }
        }
    }

    TemplateSection {
        title: i18n.tr("Standard Durations")
        className: "LomiriAnimation"

        TemplateRow {
            title: i18n.tr("Snap")

            Repeater {
                id: repeaterSnap
                model: 6
                AnimationCircle {
                    radius: units.gu(2)

                    SequentialAnimation on color {
                        PauseAnimation {
                            duration: index * LomiriAnimation.SnapDuration
                        }
                        SequentialAnimation {
                            loops: Animation.Infinite
                            ColorAnimation {
                                from: "#dd4814"
                                to: "#ddcc14"
                                duration: LomiriAnimation.SnapDuration
                            }
                            PauseAnimation {
                                duration: repeaterSnap.count * LomiriAnimation.SnapDuration
                            }
                            ColorAnimation {
                                from: "#ddcc14"
                                to: "#dd4814"
                                duration: LomiriAnimation.SnapDuration
                            }
                            PauseAnimation {
                                duration: repeaterSnap.count * LomiriAnimation.SnapDuration
                            }
                        }
                    }
                }
            }
        }
        TemplateRow {
            title: i18n.tr("Fast")

            Repeater {
                id: repeaterFast
                model: 2
                AnimationCircle {
                    radius: units.gu(11)

                    SequentialAnimation on color {
                        PauseAnimation {
                            duration: index * LomiriAnimation.FastDuration
                        }
                        SequentialAnimation {
                            loops: Animation.Infinite
                            ColorAnimation {
                                from: "#dd4814"
                                to: "#ddcc14"
                                duration: LomiriAnimation.SnapDuration
                            }
                            PauseAnimation {
                                duration: repeaterFast.count * LomiriAnimation.FastDuration
                            }
                            ColorAnimation {
                                from: "#ddcc14"
                                to: "#dd4814"
                                duration: LomiriAnimation.SnapDuration
                            }
                            PauseAnimation {
                                duration: repeaterFast.count * LomiriAnimation.FastDuration
                            }
                        }
                    }
                }
            }
        }
        TemplateRow {
            title: i18n.tr("Slow")

            AnimationCircle {
                radius: units.gu(12)

                SequentialAnimation on x {
                    loops: Animation.Infinite
                    PauseAnimation {
                        duration: 1000
                    }
                    LomiriNumberAnimation {
                        from: 0
                        to: units.gu(12)
                        duration: LomiriAnimation.SlowDuration
                    }
                    PauseAnimation {
                        duration: 300
                    }
                    PropertyAction {
                        value: 0
                    }
                }
            }
        }
        TemplateRow {
            title: i18n.tr("Sleepy")

            Item {
                width: units.gu(10)
                height: units.gu(42)

                AnimationCircle {
                    radius: units.gu(22)

                    SequentialAnimation on y {
                        loops: Animation.Infinite
                        PauseAnimation {
                            duration: 1000
                        }
                        LomiriNumberAnimation {
                            from: 0
                            to: units.gu(20)
                            duration: LomiriAnimation.SleepyDuration
                        }
                        PauseAnimation {
                            duration: 300
                        }
                        PropertyAction {
                            value: 0
                        }
                    }
                }
             }
        }
    }
}
