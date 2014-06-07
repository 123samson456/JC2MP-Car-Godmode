god = {}
godtime = Timer()

function join(args)
  args.player:SetValue("cargod",false)
end


function carenter(args)
  car = args.player:GetVehicle()
  if args.player:GetValue("cargod") == false then
    car:SetInvulnerable(false)
  end
  if args.player:GetValue("cargod") == true then
    car:SetInvulnerable(true)
  end
end


function toggle(args)
  cg = args.player:GetValue("cargod")
  if args.text == "/cargod" then
    if args.player:GetWorld() == DefaultWorld then
      if cg == true then
        args.player:SetValue("cargod",false)
        if args.player:InVehicle() then
          args.player:GetVehicle():SetInvulnerable(false)
        end
        local find = table.find(god,args.player)
        table.remove(god,find)
        args.player:SendChatMessage("Car Godmode has been disabled.",Color(0,255,0))
      end
      if cg == false then
        args.player:SetValue("cargod",true)
        if args.player:InVehicle() then
          args.player:GetVehicle():SetInvulnerable(true)
        end
        table.insert(god,args.player)
        args.player:SendChatMessage("Car Godmode has been enabled.",Color(0,255,0))
      end
    else
      args.player:SendChatMessage("You have to be in the main world",Color(255,0,0))
    end
  end
end


function carexit(args)
  car:SetInvulnerable(false)
end

function checkhp()
  if godtime:GetSeconds() > 0.5 then
    godtime:Restart()
    for index,player in pairs(god) do
      if player:InVehicle() then
        local veh = player:GetVehicle()
        if veh:GetHealth() < .5 then
          veh:SetHealth(1)
          player:SendChatMessage("Your vehicle has been repaired to avoid a explosion",Color(0,255,0))
        end
      end
    end
  end
end

Events:Subscribe("PlayerJoin", join)
Events:Subscribe("PlayerChat", toggle)
Events:Subscribe("PlayerEnterVehicle", carenter)
Events:Subscribe("PlayerExitVehicle", carexit)
Events:Subscribe("PostTick", checkhp)
