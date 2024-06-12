# IRC Command Guide

### Common Commands for Users

1. **Connecting to a Server**:
   - `/server [hostname] [port]`: Connect to an IRC server. Example: ``/server clc 6969``.

2. **Joining a Channel**:
   - `/join #[channelname]`: Join a specific channel. Example: ``/join #lounge``.

3. **Leaving a Channel**:
   - `/part #[channelname]`: Leave a specific channel. Example: ``/part #lounge``.

4. **Sending Messages**:
   - **To a Channel**: Type your message and press Enter.
   - **To a User (Private Message)**: `/msg [username] [message]`: Send a private message. Example: ``/msg Alice Hello!``.
     - **Opening a Private Chat Window**: In many IRC clients, you can double-click a user’s nickname to open a private chat window.

5. **Changing Nickname**:
   - `/nick [newnickname]`: Change your current nickname. Example: ``/nick CoolUser``.

6. **Listing Channels**:
   - `/list`: Display a list of all available channels on the server.

7. **Identifying with NickServ** (for registered nicknames):
   - `/msg NickServ IDENTIFY [password]`: Identify yourself to the NickServ service. Example: ``/msg NickServ IDENTIFY mypassword``.

8. **Setting Away Status**:
   - `/away [message]`: Set an away message. Example: ``/away Out to lunch``.
   - `/away`: Remove your away status.

9. **Inviting a User to a Channel**:
   - `/invite [username] #[channelname]`: Invite a user to a channel. Example: ``/invite Bob #lounge``.

10. **Quitting IRC**:
    - `/quit [message]`: Disconnect from the IRC server with an optional message. Example: ``/quit Goodbye!``.

11. **Viewing Topic**:
    - `/topic #[channelname]`: View the current topic of the channel. Example: ``/topic #lounge``.

12. **Ignoring Users**:
    - `/ignore [nickname]`: Ignore messages from a specific user. Example: ``/ignore Troll123``.

---

### Common Commands for Admins

1. **Granting Operator Status**:
   - `/op [username]`: Grant operator status to a user in the channel. Example: ``/op Alice``.

2. **Revoking Operator Status**:
   - `/deop [username]`: Revoke operator status from a user in the channel. Example: ``/deop Alice``.

3. **Setting Channel Topic**:
   - `/topic #[channelname] [new topic]`: Set a new topic for the channel. Example: ``/topic #lounge Welcome to the lounge!``.

4. **Banning a User**:
   - `/ban [nickname]`: Ban a user from the channel. Example: ``/ban Troll123``.
   - `/mode #[channelname] +b [nickname]`: Another way to ban a user. Example: ``/mode #lounge +b Troll123``.

5. **Unbanning a User**:
   - `/unban [nickname]`: Unban a user from the channel. Example: ``/unban Troll123``.
   - `/mode #[channelname] -b [nickname]`: Another way to unban a user. Example: ``/mode #lounge -b Troll123``.

6. **Kicking a User**:
   - `/kick #[channelname] [nickname] [reason]`: Kick a user from the channel with an optional reason. Example: ``/kick #lounge Troll123 Spamming``.

7. **Muting a User**:
   - `/mode #[channelname] +q [nickname]`: Mute a user in the channel. Example: ``/mode #lounge +q Troll123``.
   - `/mode #[channelname] +m`: Set the channel to moderated mode, where only voiced or higher status users can speak.

8. **Voicing a User**:
   - `/voice [nickname]`: Grant voice status to a user, allowing them to speak in a moderated channel. Example: ``/voice Bob``.

9. **Revoking Voice Status**:
   - `/devoice [nickname]`: Revoke voice status from a user. Example: ``/devoice Bob``.

10. **Setting Channel Modes**:
    - `/mode #[channelname] +m`: Set the channel to moderated mode.
    - `/mode #[channelname] +i`: Set the channel to invite-only mode.
    - `/mode #[channelname] +s`: Set the channel to secret mode.
    - `/mode #[channelname] +t`: Only ops can change the topic.

11. **Removing a Ban**:
    - `/mode #[channelname] -b [banmask]`: Remove a specific ban. Example: ``/mode #lounge -b *!*@*.badhost.com``.

---

**Happy Chatting and Administering, Old-School Hax0r!**

---