### MPV SCRIPT

This Lua script is designed for the MPV player and provides a "boss key" functionality. The boss key is a shortcut that allows users to quickly hide or minimize a media player window when needed. The script enables or disables this functionality using the "Ctrl + M" key combination. When enabled, the script observes various properties of the MPV player, such as seeking, pausing, and window maximization, and performs actions accordingly.

The script has the following features:

1. Toggling the script on and off using the "Ctrl + M" key binding. When toggled, an OSD message will be displayed, indicating whether the boss key is enabled or disabled.
2. Observing the "seeking" property and updating the `seeking` variable accordingly.
3. Observing the "pause" property and performing actions based on its value:
   - If the player is paused and was playing, the window will be minimized.
   - If the player is not paused, the window will be restored, and the `playing` variable will be set to true.
4. Adding a key binding "b" to pause the player and minimize the window.
5. Observing the "window-maximized" property and setting the player to fullscreen mode if the window is maximized and not seeking.

