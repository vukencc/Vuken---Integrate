# this is a simplified version of add which requires to put in an array:
# args:["EFFECT","VALUE","DURATION","TYPE","ID"]
# For TYPE: + for add_value, ++ for add_multiplied_base, +++ for add_multiplied_total
# target is set as the executed entity

$data merge storage vfam.args {args:$(args)}
data modify storage vfam.tmp effect set from storage vfam.args args[0]
data modify storage vfam.tmp value set from storage vfam.args args[1]
data modify storage vfam.tmp duration set from storage vfam.args args[2]
data modify storage vfam.tmp type set from storage vfam.args args[3]
data modify storage vfam.tmp id set from storage vfam.args args[4]
execute if data storage vfam.tmp {type:"+"} run data merge storage vfam.tmp {type:add_value}
execute if data storage vfam.tmp {type:"++"} run data merge storage vfam.tmp {type:add_multiplied_base}
execute if data storage vfam.tmp {type:"+++"} run data merge storage vfam.tmp {type:add_multiplied_total}
function vfam:add/pack with storage vfam.tmp