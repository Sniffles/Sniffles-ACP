local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales

-- //													\\
-- // Credits to Elv22 ( Based on his RaidUtility )		\\
-- // Some codes from Tukui Skinner *sniff*				\\

-- // Globals
local UIParent = UIParent

-- Main Panel
local f = CreateFrame("Frame", "SnifflesACP", UIParent)
f:Point("RIGHT", UIParent, "LEFT", 165, 0)
f:Width(160)
f:Height(155)
f:SetTemplate("Default")
f:SetClampedToScreen(true)
f.toggled = false

-- Header of Main Panel
local fheader = CreateFrame("Frame", "SnifflesACPHeader", SnifflesACP)
fheader:Point("TOPLEFT", SnifflesACP, 0, 20)
fheader:Point("TOPRIGHT", SnifflesACP, 0, 20)
fheader:Height(15)
fheader:SetTemplate("Default")
fheader:SetClampedToScreen(true)
fheader.toggled = false

fheader.text = sn.SetFontString(fheader, C.media.font, 12)
fheader.text:SetText("|cff1784d1Sniffles|r ACP")
fheader.text:Point("CENTER", fheader)

-- |cff1784d1 

--Show Button
sn.CreateBtn("snShowButton", ElvUIParent or UIParent, "UIMenuButtonStretchTemplate, SecureHandlerClickTemplate", 18, 80, sn.sniffles_acp_1, ">", 22)
snShowButton:Point("RIGHT", ElvUIParent or UIParent, "LEFT", 23, 0)
snShowButton:SetFrameRef("SnifflesACP", SnifflesACP)
snShowButton:SetAttribute("_onclick", [=[self:Hide(); self:GetFrameRef("SnifflesACP"):Show();]=])
snShowButton:SetScript("OnMouseUp", function(self) SnifflesACP.toggled = true end)
snShowButton:SetFrameStrata("Background")

--Close Button
sn.CreateBtn("snCloseButton", SnifflesACP, "UIMenuButtonStretchTemplate, SecureHandlerClickTemplate", 20, 175, sn.sniffles_acp_2, "<", 22)
snCloseButton:Point("BOTTOMLEFT", SnifflesACP, "BOTTOMRIGHT", 5, 0)
snCloseButton:SetFrameRef("snShowButton", snShowButton)
snCloseButton:SetAttribute("_onclick", [=[self:GetParent():Hide(); self:GetFrameRef("snShowButton"):Show();]=])
snCloseButton:SetScript("OnMouseUp", function(self) SnifflesACP.toggled = false end)

sn.CreateBtn("snFocusButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_3, sn.sniffles_acp_3, 12)
snFocusButton:SetAttribute("type1", "macro") 
snFocusButton:SetAttribute("macrotext1", "/focus")

sn.CreateBtn("snReloadUIButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_4, sn.sniffles_acp_4, 12)
snReloadUIButton:SetAttribute("type1", "macro") 
snReloadUIButton:SetAttribute("macrotext1", "/rl")

sn.CreateBtn("snMoveUIButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_5, sn.sniffles_acp_5, 12)
snMoveUIButton:SetAttribute("type1", "macro") 
snMoveUIButton:SetAttribute("macrotext1", "/moveui")

sn.CreateBtn("snUIHelpButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_6, sn.sniffles_acp_6, 12)
snUIHelpButton:SetAttribute("type1", "macro") 
snUIHelpButton:SetAttribute("macrotext1", "/uihelp")

sn.CreateBtn("snReadyCheckButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_7, sn.sniffles_acp_7, 12)
snReadyCheckButton:SetAttribute("type1", "macro") 
snReadyCheckButton:SetAttribute("macrotext1", "/rc")

sn.CreateBtn("snLeavePartyButton", SnifflesACP, "UIPanelButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_8, sn.sniffles_acp_8, 12)
snLeavePartyButton:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" then
		LeaveParty()
	end
end)

sn.CreateBtn("snPtR", SnifflesACP, "UIPanelButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_9, sn.sniffles_acp_9, 12)
snPtR:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" then
		ConvertToRaid()
	end
end)

sn.CreateBtn("snRtP", SnifflesACP, "UIPanelButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_10, sn.sniffles_acp_10, 12)
snRtP:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" then
		ConvertToParty()
	end
end)

sn.CreateBtn("snTukuiCfgButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_11, sn.sniffles_acp_11, 12)
snTukuiCfgButton:SetAttribute("type1", "macro") 
snTukuiCfgButton:SetAttribute("macrotext1", "/tukui")

sn.CreateBtn("snHealLayoutButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20,  sn.sniffles_acp_tooltip_12, sn.sniffles_acp_12, 12)
snHealLayoutButton:SetAttribute("type1", "macro") 
snHealLayoutButton:SetAttribute("macrotext1", "/heal")

sn.CreateBtn("snDPSLayoutButton", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_13, sn.sniffles_acp_13, 12)
snDPSLayoutButton:SetAttribute("type1", "macro") 
snDPSLayoutButton:SetAttribute("macrotext1", "/dps")

sn.CreateBtn("snEnableAddOn", SnifflesACP, "UIPanelButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_14, sn.sniffles_acp_14, 12)
snEnableAddOn:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" then
		local editbox = _G["ChatFrame1EditBox"]
		editbox:SetText("/enable ")
	end
end)

sn.CreateBtn("snDisableAddOn", SnifflesACP, "UIPanelButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_15, sn.sniffles_acp_15, 12)
snDisableAddOn:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" then
		local editbox = _G["ChatFrame1EditBox"]
		editbox:SetText("/disable ")
	end
end)

sn.CreateBtn("snHoverBind", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_16, sn.sniffles_acp_16, 12)
snHoverBind:SetAttribute("type1", "macro") 
snHoverBind:SetAttribute("macrotext1", "/hb")

sn.CreateBtn("snCombatLogFix", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_17, sn.sniffles_acp_17, 12)
snCombatLogFix:SetAttribute("type1", "macro") 
snCombatLogFix:SetAttribute("macrotext1", "/clfix")

sn.CreateBtn("snAutoInviteOff", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_19, sn.sniffles_acp_18, 12)
snAutoInviteOff:SetAttribute("type1", "macro")
snAutoInviteOff:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" then
		snAutoInviteOff:SetAttribute("macrotext1", "/ainv off")
		self:Hide()
		snAutoInviteOn:Show()
	end
end)

sn.CreateBtn("snAutoInviteOn", SnifflesACP, "SecureActionButtonTemplate", 70, 20, sn.sniffles_acp_tooltip_18, sn.sniffles_acp_18, 12)
snAutoInviteOn:SetAttribute("type1", "macro")
snAutoInviteOn:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" then
		snAutoInviteOn:SetAttribute("macrotext1", "/ainv")
		self:Hide()
		snAutoInviteOff:Show()
		snAutoInviteOff:SetPoint("TOPRIGHT", SnifflesACP, "TOPRIGHT", -5, -130)
	end
end)

-- haha :P
local haha = CreateFrame("Frame")
haha:RegisterEvent("PLAYER_REGEN_ENABLED")
haha:RegisterEvent("PLAYER_REGEN_DISABLED")
haha:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_REGEN_DISABLED" then
		SnifflesACP:Hide()
		snShowButton:Hide()
		snCloseButton:Hide()
	elseif event == "PLAYER_REGEN_ENABLED" then
		snShowButton:Show()
		snCloseButton:Show()
	end
end)

-- // Set Points

sn.SP(sn["ACP"].RCBtn, snReadyCheckButton)
sn.SP(sn["ACP"].LeavePBtn, snLeavePartyButton)
sn.SP(sn["ACP"].FocusBtn, snFocusButton)
sn.SP(sn["ACP"].MoveUIBtn, snMoveUIButton)
sn.SP(sn["ACP"].UIHelpBtn, snUIHelpButton)
sn.SP(sn["ACP"].CvtRtP, snRtP)
sn.SP(sn["ACP"].CvtPtR, snPtR)
sn.SP(sn["ACP"].CfgBtn, snTukuiCfgButton)
sn.SP(sn["ACP"].DPSLayoutBtn, snDPSLayoutButton)
sn.SP(sn["ACP"].HealLayoutBtn, snHealLayoutButton)
sn.SP(sn["ACP"].ReloadUIBtn, snReloadUIButton)
sn.SP(sn["ACP"].LoadAddOnBtn, snEnableAddOn)
sn.SP(sn["ACP"].DisableAddOnBtn, snDisableAddOn)
sn.SP(sn["ACP"].HoverBindBtn, snHoverBind)
sn.SP(sn["ACP"].CombatLogFixBtn, snCombatLogFix)
sn.SP(sn["ACP"].AutoInviteBtn, snAutoInviteOn)