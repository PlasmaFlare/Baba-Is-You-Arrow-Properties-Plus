# Baba Is You - Arrow Properties Plus

A Baba Is You mod that adds variants of existing properties as directional arrows. Also adds arrow properties where their meaning changes based on their facing direction.

Best if you look at some gifs for a full explaination:

<img src="turning_fall.gif" alt="drawing" width="800"/>
<img src="turning_text.gif" alt="drawing" width="800"/>
<img src="arrow_properties.gif" alt="drawing" width="800"/>

# Changelog
- **1.1.3** (3/10/21)
  - Fixed game freezing when "level is shift" is formed (bug introduced by official beta update)
- **1.1.2** (3/5/21)
  - Added turning select
  - Removed redundant turning text sprites  
- **1.1.1** (2/28/21)
  - Updated for beta 398
- **1.1.0** (2/11/21)
  - Updated for beta 394
  - New arrow properties! You, You2, Push, Pull, Stop, Swap, More and Shift
  - Turning text variations of the new arrow properties
  - Renamed the mod to Arrow Properties Plus

- **1.0.1** (2/7/21)
  - Updated for beta 393

- **1.0.0** (1/24/21)
  - Initial release

# Installation

- Requires Steam version on beta version 390 (future beta versions may or may not work depending on how much the base code is changed)

To install, copy both Lua and Sprites folder into the levelpack you want to include the mod. Make sure the world_data.txt in the levelpack folder has `mods=1` set underneath the `[General]` section.

The new text blocks can be found in the level editor at the end of the list.

- **Note about directional shift**: directional shift's implementation rewrites a lot of the game's code and slightly changes how stacking shifts behave. If you want to use the old behavior while keeping this mod, open `Lua\add_to_editor.lua` and set `enable_directional_shift=false`. This will make the arrow shift properties behave like regular shift, regardless of direction.


- **FOR MODDERS/LEVELPACK MAKERS**: if you want to include this mod with other mods, I've overriden a few of the main game functions but made sure to minimalize my changes so that you can easily place it in your versions of the overrided functions.
The lines surrounded by `--@ Turning Text` are my changes, while turning_text_functions.lua provides the main functionality and contains no overrides. However, *there is no guarantee that this mod will work nicely with other mods*.

Please credit me if you do use use this mod in a levelpack or include this with other mods :)