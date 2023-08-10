# Enhanced QB-Menu

## Dual Compatibility: ox_lib and Standard QB-Menu Integration

A versatile menu system designed for seamless integration with the QBCore Framework, supporting both **[ox_lib](https://github.com/overextended/ox_lib)** and the classic QB-Menu.

Built upon the foundation of **[NH Context](https://forum.cfx.re/t/no-longer-supported-standalone-nerohiro-s-context-menu-dynamic-event-firing-menu/2564083)** by **[NeroHiro](https://github.com/nerohiro)**, this modified version offers enhanced functionality and a revamped user experience.

## Usage

Integrate stunning menus into your QBCore project with ease using the provided code snippets:

```lua
RegisterCommand("qbmenutest", function(source, args, raw)
    openMenu({
        {
            header = "Main Title",
            isMenuHeader = true,
        },
        {
            header = "Sub Menu Button",
            txt = "Explore Sub Menu",
            params = {
                event = "qb-menu:client:testMenu2",
                args = {
                    number = 1,
                }
            }
        },
        -- Additional menu items can be added here
    })
end)
```

```lua
RegisterNetEvent('qb-menu:client:testMenu2', function(data)
    local number = data.number
    openMenu({
        {
            header = "< Go Back",
        },
        {
            header = "Number: " .. number,
            txt = "Other Option",
            params = {
                event = "qb-menu:client:testButton",
                args = {
                    message = "Clicked this button!"
                }
            }
        },
        -- More menu items can be added here
    })
end)
```

```lua
RegisterNetEvent('qb-menu:client:testButton', function(data)
    TriggerEvent('QBCore:Notify', data.message)
end)
```

## License

This menu system is developed under the QBCore Framework and is licensed under the GNU General Public License. For full details, please refer to the [license documentation](LICENSE.md).

---

<p align="center">
  Visit the QBCore Framework GitHub Repository: [QBCore](https://github.com/qbcore-framework/qb-core)
</p>

