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
    if cg == true then
      args.player:SetValue("cargod",false)
      args.player:SendChatMessage("Car Godmode has been disabled.",Color.FireBrick)
    end
    if cg == false then
      args.player:SetValue("cargod",true)
      args.player:SendChatMessage("Car Godmode has been enabled.",Color.Green)
    end
  end

end


function carexit(args)

  car = args.player:GetVehicle()
  car:SetInvulnerable(false)

end



Events:Subscribe("PlayerJoin", join)
Events:Subscribe("PlayerChat", toggle)
Events:Subscribe("PlayerEnterVehicle", carenter)
--Events:Subscribe("PlayerExitVehicle", carexit)
