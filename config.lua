Config = {}

Config.Location = vector4(-269.04, -956.03, 31.22, 206.51)

Config.JobMenus = {
    {
        header = "Rennaisance State Job Center",
        icon = "fas fa-briefcase",
        isMenuHeader = true
    },
    {
        header = "Being Lazy And Doing Nothing",
        txt = "You Are trash!",
        icon = "fas fa-trash",
        params = {
            isServer = true,
            event = "rst-jobcenter:server:takeJob",
            args = {
                jobName = "unemployed",
                jobLabel = "Being Lazy And Doing Nothing"
            }
        }
    },
    {
        header = "Garbage Collector",
        txt = "Collect garbage around the city and make money from it",
        icon = "fas fa-trash",
        params = {
            isServer = true,
            event = "rst-jobcenter:server:takeJob",
            args = {
                jobName = "garbage",
                jobLabel = "Garbage Collector"
            }
        }
    },
    {
        header = "Taxi",
        txt = "Drive NPC's or real players around and make money from it",
        icon = "fas fa-taxi",
        params = {
            isServer = true,
            event = "rst-jobcenter:server:takeJob",
            args = {
                jobName = "taxi",
                jobLabel = "Taxi"
            }
        }
    },
    {
        header = "Trucker",
        txt = "Just Truck Driver, Yeah That's it What you expect ?",
        icon = "fas fa-truck",
        params = {
            isServer = true,
            event = "rst-jobcenter:server:takeJob",
            args = {
                jobName = "trucker",
                jobLabel = "Trucker"
            }
        }
    },
    {
        header = "⬅ Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu"
        }
    }
}
