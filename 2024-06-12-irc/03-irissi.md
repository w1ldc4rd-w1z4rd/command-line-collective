# Irssi Hotkeys

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

---

### Basic Navigation Hotkeys

1. **Switching Between Windows**:
   - Alt + [number]: Switch to the specific window (e.g., Alt + 1 to switch to window 1).
   - Alt + Left Arrow or Alt + Right Arrow: Move to the previous or next window.
   - Ctrl + p or Ctrl + n: Move to the previous or next window.

2. **Scrolling Through Text**:
   - PgUp and PgDn: Scroll up and down through the chat history.
   - Ctrl + u and Ctrl + d: Scroll up and down half a page.

3. **Switching to the Active Window**:
   - Alt + a: Switch to the window with the most recent activity.

### Window Management Commands

1. **Creating and Closing Windows**:
   - /window new split: Create a new window split with a new window.
   - /window close: Close the current window.

2. **Moving Windows**:
   - /window move [number]: Move the current window to a different number. Example: /window move 2.
   - /window number [number]: Change the window number. Example: /window number 3.

3. **Renaming Windows**:
   - /window name [name]: Give the current window a new name. Example: /window name Chat.
   
4. **Merging Windows**:
   - /window merge [number]: Merge the current window with another. Example: /window merge 1.

5. **Splitting Windows**:
   - /window new split: Split the current window.
   - /window resize [+/-lines]: Resize the split window. Example: /window resize +5 to increase by 5 lines.

### Persistent History

1. **Enabling Persistent History**:
   - Edit the Irssi configuration file (usually ~/.irssi/config).
   - Add the following settings within the settings section:
     perl
     settings = {
         "fe-common/core" = {
             save_window_history = "yes";
         };
     };
     
   - This setting will save the history of your windows when you quit Irssi and reload it when you start Irssi again.

2. **Saving History Manually**:
   - /save: Save the current configuration and history manually.

### Modifying Settings

1. **Changing Nickname**:
   - /nick [newnickname]: Change your current nickname. Example: /nick CoolUser.

2. **Setting Up Autojoin Channels**:
   - /channel add -auto [#channel] [server]: Automatically join a channel when connecting to a server. Example: /channel add -auto #lounge irc.server.net.

3. **Changing Text Formats**:
   - Edit the Irssi configuration file or use the following command to change text formats on the fly:
     perl
     /format pubmsg {pubmsgnick $2 {pubnick $0}} $1
     
   - This example changes the format of public messages.

4. **Configuring Logging**:
   - /set autolog on: Enable automatic logging.
   - /set autolog_path ~/irclogs/$tag/$0.log: Set the path for log files.
   - /window log on: Start logging the current window.
   - /window log off: Stop logging the current window.

### Other Useful Commands

1. **Viewing Help**:
   - /help: Display a list of available commands.
   - /help [command]: Get detailed help on a specific command. Example: /help nick.

2. **Ignoring Users**:
   - /ignore [nickname]: Ignore messages from a specific user. Example: /ignore Troll123.

3. **Listing Channels**:
   - /list: Display a list of all available channels on the server.

4. **Joining Channels**:
   - /join #[channelname]: Join a specific channel. Example: /join #lounge.

5. **Leaving Channels**:
   - /part #[channelname]: Leave a specific channel. Example: /part #lounge.

### Customizing Key Bindings

1. **Customizing Key Bindings**:
   - Edit the ~/.irssi/config file to add or change key bindings.
   - For example, to bind Ctrl + k to close the current window:
     perl
     bind ^K /window close
     

---

**Happy Chatting and Administering, Old-School Hax0r!**

---