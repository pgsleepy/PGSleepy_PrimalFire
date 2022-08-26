SLASH_HELLO1 = "/primal_start"
local total_times = 0

local function DoReadyAndRotation()
    total_times = total_times + 1;
    if (total_times > 4) then
        total_times = 0
        SendChatMessage("[Arlow's PrimalFire ADDON]: Last run before rotations! (5/5)", "PARTY", "Common");
        SendChatMessage("[Arlow's PrimalFire ADDON]: Resetting counter!", "PARTY", "Common");
        DoReadyCheck();
        return
    end
    DoReadyCheck()
    SendChatMessage("[Arlow's PrimalFire ADDON]: This will be run " .. total_times .. "/5!", "PARTY", "Common");
end

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_SYSTEM")
f:SetScript("OnEvent", function(self, event, msg)
    if strfind(msg, "Everyone is Ready") then --Check if the System Message contains the string "ready".
        PlaySound(5274)
        SendChatMessage("[Arlow's PrimalFire ADDON]: Everyone is ready, let's start!", "PARTY", "Common");
        DEFAULT_CHAT_FRAME.editBox:SetText("/countdown 105")
        ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
    end
end)

local function startCommand()
    DoReadyAndRotation()
end

SlashCmdList["HELLO"] = startCommand
