-- (C) Michael Norris 12/7/ 2023
--Filename: LocationTester.Lua
--Purpose: Help me track down what exactly are the values
-- that are being held and tracked in the pos variables in
--Battletoads NES, I will attempt to document them as I slowly figure it out
while true do
    Objects_Xpos_H = memory.readbyte(0x03EE)
    print(string.format("Objects_Xpos_H is: %d", Objects_Xpos_H))

    player2_Xpos_H = {}
    for slot=0,12 do
        local temp_x = memory.readbyte(0x3EF + slot)

        player2_Xpos_H[#player2_Xpos_H+1] = temp_x
    end
    
    print("player2_Xpos_H:")
    for slot=0,12 do --It appears to be 13 bytes long so this should cover the whole thing
        print(string.format("The value of player2_Xpos_H in slot %d is: %d", slot, player2_Xpos_H[slot]))
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
        print(string.format("The value of sprite2_Xpos at slot %d is: %d", slot, sprite2_Xpos[slot]))
    end

    






end