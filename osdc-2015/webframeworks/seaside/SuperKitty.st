Seaside.WAComponent subclass: SuperKitty [
    | kittypic |

    SuperKitty class >> canBeRoot [ ^true ]

    initialize [
        super initialize.
    ]

    states [ ^{ self } ]

    renderContentOn: html [ html heading: 'mega OO uber kitty app!' ]
]

SuperKitty registerAsApplication: 'superkitty'.
