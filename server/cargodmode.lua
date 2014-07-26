function GetPlayerBySteamId( steamid_string )
    for player in Server:GetPlayers() do
        if player:GetSteamId().string == steamid_string then
            return player
        end
    end
end

class 'CarGod'

function CarGod:__init()
    self.godTable = {}
    self.godTimer = Timer()
    self.checkInterval = 0.5
    Events:Subscribe( "PlayerChat", self, self.PlayerChat )
    Events:Subscribe( "PlayerEnterVehicle", self, self.EnterVehicle )
    Events:Subscribe( "PlayerExitVehicle", self, self.ExitVehicle )
    Events:Subscribe( "PostTick", self, self.PostTick )
end

function CarGod:PlayerChat( args )
    if args.text:lower( ) == "/cargod" then
        local playerValue = args.player:GetValue( "CarGod" )
        if playerValue == true then
            args.player:SetValue( "CarGod", false )
            args.player:SendChatMessage( "[CarGod] CarGod disabled.", Color.Gold )
            if IsValid( args.player:GetVehicle() ) then
                local vehicle = self.godTable[args.player:GetSteamId().string]
                vehicle:SetInvulnerable( false )
                vehicle = nil
            end
        else
            args.player:SetValue( "CarGod", true )
            args.player:SendChatMessage( "[CarGod] CarGod enabled.", Color.Gold )
            self:EnterVehicle( args )
        end
    end
    if args.text == "/sky" then
        args.player:SetPosition( args.player:GetPosition() + Vector3( 0, 500, 0 ) )
    end
end

function CarGod:EnterVehicle( args )
    local playerValue = args.player:GetValue( "CarGod" )
    if playerValue then
        local vehicle = args.player:GetVehicle()
        if args.player:InVehicle() then
            vehicle:SetInvulnerable( true )
            self.godTable = {
                [args.player:GetSteamId().string] = vehicle
            }
            print( tostring(self.godTable[args.player:GetSteamId().string]) )
        end
    end
end

function CarGod:ExitVehicle( args )
    local vehicle = self.godTable[args.player:GetSteamId().string]
    if IsValid( vehicle ) then
        vehicle:SetInvulnerable( false )
        vehicle = nil
    end
end

function CarGod:PostTick( )
    if self.godTimer:GetSeconds() >= self.checkInterval then
        for steamid, vehicle in pairs( self.godTable ) do
            if IsValid( vehicle ) then
                if GetPlayerBySteamId( steamid ):GetValue( "CarGod" ) == true then
                    vehicle:SetHealth( 1 )
                end
            end
        end
    end
end

CarGod = CarGod()
