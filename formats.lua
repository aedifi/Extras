-- formats.lua
-- Implements format prefixes and the change of text color.

function Greentext(Player, Message)
	if string.starts(Message, ">") then
		return false, (cChatColor.LightGreen .. Message)
	else
	end
end

function Comment(Player, Message)
	if string.starts(Message, "#") then
		return false, (cChatColor.LightGray .. Message)
	else
	end
end

function Blocktext(Player, Message)
	if string.starts(Message, "$") then
		return false, (cChatColor.Gray .. Message)
	else
	end
end

function string.starts(String, Start)
    return string.sub(String,1,string.len(Start))==Start
end

function string.ends(String, End)
    return string.sub(String,1,string.len(End))==End
end