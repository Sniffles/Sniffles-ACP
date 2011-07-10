local T, C, L = unpack(Tukui)

function sn.SetFontString(parent, fontName, fontHeight, fontStyle)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(fontName, fontHeight, fontStyle)
	fs:SetJustifyH("LEFT")
	fs:SetShadowColor(0, 0, 0)
	fs:SetShadowOffset(1.25, -1.25)
	return fs
end

function sn.CreateBtn(name, parent, template, width, height, tip, text, fsize)
	local b = CreateFrame("Button", name, parent, template)
	b:Width(width)
	b:Height(height)
	b:StripTextures(true)
	b:SetTemplate("Default")
	b:HookScript("OnEnter", function(self)
		self:SetBackdropColor(unpack(C["media"].backdropcolor))
		self:SetBackdropBorderColor(24/255, 116/255, 205/255, 1)
		GameTooltip:SetOwner(self, "ANCHOR_TOP")
		GameTooltip:AddLine(tip, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end)
	b:HookScript("OnLeave", function(self)
		self:SetBackdropColor(unpack(C["media"].backdropcolor))
		self:SetBackdropBorderColor(unpack(C["media"].bordercolor))
		GameTooltip:Hide()
	end)	
	b:EnableMouse(true)
	b:RegisterForClicks("AnyUp")
	
	b.text = sn.SetFontString(b, C.media.font, fsize)
	b.text:SetText(text)
	b.text:Point("CENTER", b)
	
	if fsize == 12 then
		b.text:Size(65, 20)
	end
end

function sn.SP(p, obj)
	local acp = SnifflesACP
	
	if p == 1 then
		obj:SetPoint("TOPLEFT", acp, "TOPLEFT", 5, -5)
	elseif p == 2 then
		obj:SetPoint( "TOPRIGHT", acp, "TOPRIGHT", -5, -30)
	elseif p == 3 then
		obj:SetPoint("TOPRIGHT", acp, "TOPRIGHT", -5, -55)
	elseif p == 4 then
		obj:SetPoint("TOPLEFT", acp, "TOPLEFT", 5, -30)
	elseif p == 5 then
		obj:SetPoint("TOPLEFT", acp, "TOPLEFT", 5, -55)
	elseif p == 6 then
		obj:SetPoint("TOPLEFT", acp, "TOPLEFT", 5, -80)
	elseif p == 7 then
		obj:SetPoint("TOPRIGHT", acp, "TOPRIGHT", -5, -80)
	elseif p == 8 then
		obj:SetPoint("TOPRIGHT", acp, "TOPRIGHT", -5, -5)
	elseif p == 9 then
		obj:SetPoint("TOPRIGHT", acp, "TOPRIGHT", -5, -105)
	elseif p == 10 then
		obj:SetPoint("TOPLEFT", acp, "TOPLEFT", 5, -105)
	elseif p == 11 then
		obj:SetPoint("TOPLEFT", acp, "TOPLEFT", 5, -130)
	elseif p == 12 then
		obj:SetPoint("TOPRIGHT", acp, "TOPRIGHT", -5, -130)
	end
end