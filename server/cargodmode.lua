function join(args)
  
  args.player:SetValue("cargod",false)
  
end


function carenter(args)
  
  car = args.player:GetVehicle()
  
  if args.player:GetValue("cargod") == false then
    car:SetInvulnerable(true)
  end
  if args.player:GetValue("cargod") == true then
    car:SetInvulnerable(false)
  end
    
end


function toggle(args)

  if args.player:InVehicle() then

    if args.player:GetValue("cargod") == false then
      if args.text == "/cargod" then
        --Sets Vehicle Invulnerable
        local veh = args.player:GetVehicle()
        veh:SetInvulnerable(true)
        --Message Output
        args.player:SendChatMessage("Car Godmode is on!",Color(34, 139, 34))
        --Setting cargod true
        args.player:SetValue("cargod",true) 
      end
  end
  if args.player:GetValue("cargod") == true then
      if args.text == "/cargod" then
        --Resets Vehicle Attributes (Invulnerable())
        local veh = args.player:GetVehicle()
        veh:SetInvulnerable(false)
        --Message Output
        args.player:SendChatMessage("Car Godmode is off!",Color(34, 139, 34))
        --Setting cargod false
        args.player:SetValue("cargod",false)
      end
  end

  end

end


function carexit(args)
  
  car:SetInvulnerable(false)
  
end
    
    

Events:Subscribe("PlayerChat", join)
Events:Subscribe("PlayerChat", toggle)
Events:Subscribe("PlayerEnterVehicle", carenter)
Events:Subscribe("PlayerExitVehicle", carexit)
