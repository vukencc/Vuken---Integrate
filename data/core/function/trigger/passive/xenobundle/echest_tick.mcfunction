particle enchant ~ ~ ~ -1 -1 -1 3.5 10 normal
execute unless function core:trigger/passive/xenobundle/if_to_off run return fail
execute on vehicle run function operation:stats/kill_this
function operation:stats/kill_this