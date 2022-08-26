SLASH_HELLO1 = "/primal_start"
local total_times = 1

local function endRotation()
    total_times = 1
    SendChatMessage("{rt1} COUNTER RESET TO 1/5 {rt1}", "PARTY", "Common");
    SendChatMessage("----------------------------------------------", "PARTY", "Common");
    SendChatMessage("[Arlow's PrimalFire ADDON]: {rt8} GOES TO {X}", "PARTY", "Common");
    SendChatMessage("[Arlow's PrimalFire ADDON]: {X} GOES TO {rt6}", "PARTY", "Common");
    SendChatMessage("[Arlow's PrimalFire ADDON]: {rt6} GOES TO {rt5}", "PARTY", "Common");
    SendChatMessage("[Arlow's PrimalFire ADDON]: {rt5} GOES TO {rt4}", "PARTY", "Common");
    SendChatMessage("[Arlow's PrimalFire ADDON]: {rt4} GOES TO {rt8}", "PARTY", "Common");
    return
end

local function endRun()
    SendChatMessage("[Arlow's PrimalFire ADDON]: {rt1} LOOT NOW {rt1}", "PARTY", "Common");
    return
end

local function DoReadyAndRotation()
    DoReadyCheck()
    SendChatMessage("[Arlow's PrimalFire ADDON]: This will be run " .. total_times .. "/5!", "PARTY", "Common");
end

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_SYSTEM")
f:SetScript("OnEvent", function(self, event, msg)
    if strfind(msg, "Everyone is Ready") then --Check if the System Message contains the string "ready".
        total_times = total_times + 1;
        if (total_times > 4) then
            SendChatMessage("[Arlow's PrimalFire ADDON]: Last run before rotations! (5/5)", "PARTY", "Common");
            PlaySound(5274)
            SendChatMessage("[Arlow's PrimalFire ADDON]: Everyone is ready, let's start!", "PARTY", "Common");
            DEFAULT_CHAT_FRAME.editBox:SetText("/countdown 105")
            ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
            --After Countdown
            C_Timer.After(95, endRotation)
            return
        end
        PlaySound(5274)
        SendChatMessage("[Arlow's PrimalFire ADDON]: Everyone is ready, let's start!", "PARTY", "Common");
        DEFAULT_CHAT_FRAME.editBox:SetText("/countdown 105")
        ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
        C_Timer.After(105, endRun)
    end
end)

local function startCommand()
    DoReadyAndRotation()
end

SlashCmdList["HELLO"] = startCommand
