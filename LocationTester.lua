-- (C) Michael Norris 12/7/ 2023
--Filename: LocationTester.Lua
--Purpose: Help me track down what exactly are the values
-- that are being held and tracked in the pos variables in
--Battletoads NES, I will attempt to document them as I slowly figure it out
Objects_Xpos_old = 0
player2_Xpos_old = {}
for slot=0,12 do
    player2_Xpos_old[#player2_Xpos_old+1] = 0
end
Object14_Xpos_old = 0
Sprites_Xpos_old = 0
sprite2_Xpos_old = {}
for slot=0,13 do
    sprite2_Xpos_old[#sprite2_Xpos_old+1] = 0
end

while true do
    Objects_Xpos_H = memory.readbyte(0x03EE)
    if (Objects_Xpos_old ~= Objects_Xpos_H) then
        print(string.format("Objects_Xpos_H is: %d", Objects_Xpos_H))
        Objects_Xpos_old = Objects_Xpos_H
    end



    player2_Xpos_H = {}
    for slot=0,12 do
        local temp_x = memory.readbyte(0x3EF + slot)

        player2_Xpos_H[#player2_Xpos_H+1] = temp_x
    end
    
    --print("player2_Xpos_H:")
    for slot=0,12 do --It appears to be 13 bytes long so this should cover the whole thing
        if (player2_Xpos_H[slot] == nil and (player2_Xpos_old[slot] ~= player2_Xpos_H[slot])) then
            print(string.format("The value of player2_Xpos_H in slot %d is NIL!", slot))
        else
            print(string.format("The value of player2_Xpos_H in slot %d is: %d", slot, player2_Xpos_H[slot]))
        end
    end

    Object14_Xpos_H = memory.readbyte(0x03FC)
    print(string.format("Object14_Xpos_H is: %d", Object14_Xpos_H))

    Sprites_Xpos = memory.readbyte(0x203)
    print(string.format("Sprites_Xpos is: %d", Sprites_Xpos))

    sprite2_Xpos = {}
    for slot=0,13 do
        local temp_x = memory.readbyte(0x207+slot)
        sprite2_Xpos[#sprite2_Xpos+1] = temp_x
    end

    --print the values of sprite2_Xpos
    print("sprite2_Xpos")
    for slot=0,13 do
        if (sprite2_Xpos[slot] == nil) then
            print(string.format("The value of sprite2_Xpos at slot %d is: NIL!", slot))
        else
            print(string.format("The value of sprite2_Xpos at slot %d is: %d", slot, sprite2_Xpos[slot]))
        end
    end





    --this is unportable as heck but I dont have a better solution atm
    os.execute("sleep 1")

end