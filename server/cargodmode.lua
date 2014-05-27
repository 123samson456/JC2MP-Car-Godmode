function invulnerable(args)

  if args.player:InVehicle() then

    if args.text == "/caron" then

      --Sets Vehicle Invulnerable
      local on = args.player:GetVehicle()
      on:SetInvulnerable(true)

      --Message Output
      args.player:SendChatMessage("Car Godmode is on!",Color(0,255,0))

    end

    if args.text == "/caroff" then

     --Resets Vehicle Attributes (Invulnerable())
     local on = args.player:GetVehicle()
     on:SetInvulnerable(false)

     --Message Output
     args.player:SendChatMessage("Car Godmode is off!",Color(0,255,0))

    end

  end

end

Events:Subscribe("PlayerChat", invulnerable)
