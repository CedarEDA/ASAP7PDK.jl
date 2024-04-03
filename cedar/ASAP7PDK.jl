module ASAP7PDK

module asap7_tt
    using CedarSim
    using CMC: bsimcmg107
    sp"""
    .include "../models/hspice/7nm_TT_160803.pm"
    """
end

module asap7_ff
    using CedarSim
    using CMC: bsimcmg107
    sp"""
    .include "../models/hspice/7nm_FF_160803.pm"
    """
end

module asap7_ss
    using CedarSim
    using CMC: bsimcmg107
    sp"""
    .include "../models/hspice/7nm_SS_160803.pm"
    """
end

const d = Dict{String,  Module}(
    "7nm_TT.pm" => asap7_tt,
    "7nm_FF.pm" => asap7_ff,
    "7nm_SS.pm" => asap7_ss
)

function get_module(name::String)
    try
        return d[name]
    catch
        throw(ArgumentError("File \"$name\" not found in $(keys(d))"))
    end
end


end # module ASAP7PDK
