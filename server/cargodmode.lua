--Setting a variable cargod
cargod = false
car = args.player:GetVehicle()

function carenter(args)
  
  car = args.player:GetVehicle()
  
  if cargod then
    car:SetInvulnerable(true)
  else
    car:SetInvulnerable(false)
  end
    
end


function toggle(args)

  if args.player:InVehicle() then

    if not cargod then
      if args.text == "/cargod" then
        --Sets Vehicle Invulnerable
        local on = args.player:GetVehicle()
        on:SetInvulnerable(true)
        --Message Output
        args.player:SendChatMessage("Car Godmode is on!",Color(0,255,0))
        --Setting cargod true
        cargod = true  
      end
    else
      if args.text == "/cargod" then
        --Resets Vehicle Attributes (Invulnerable())
        local on = args.player:GetVehicle()
        on:SetInvulnerable(false)
        --Message Output
        args.player:SendChatMessage("Car Godmode is off!",Color(0,255,0))
        --Setting cargod false
        cargod = false
      end
    end

  end

end


function carexit(args)
  
  car:SetInvulnerable(false)
  
end
    
    

Events:Subscribe("PlayerChat", toggle)
Events:Subscribe("PlayerEnterVehicle", carenter)
Events:Subscribe("PlayerExitVehicle", carexit)
