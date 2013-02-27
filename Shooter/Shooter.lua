local Shooter = Shooter or {shootOnNextTick = false, delay = 0};

Shooter.frame = CreateFrame("Frame", "Shooter", UIParent);
Shooter.frame:SetFrameStrata("BACKGROUND");

Shooter.frame:SetScript("OnEvent",
  function (self, event, ...)
    if (event and event == "ACHIEVEMENT_EARNED") then
      Shooter.shootOnNextTick = true;
      Shooter.delay = 0;
    end
  end
);

Shooter.frame:SetScript("OnUpdate",
  function (self, elapsed, ...)
    Shooter.delay = Shooter.delay + elapsed;
    
    if (Shooter.shootOnNextTick and Shooter.delay >= 1) then
      Shooter.shootOnNextTick = false;
      Shooter.delay = 0;
      TakeScreenshot();
    end
  end
);

Shooter.frame:RegisterEvent("ACHIEVEMENT_EARNED");