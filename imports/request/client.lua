
--- sl.request.anim_dict
---@param animDict string
---@param cb function
local function AnimDict(animDict, cb)
	if not HasAnimDictLoaded(animDict) then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(0)
		end
	end
    if cb then cb() end
end

--- sl.request.anim_set
---@param animSet string
---@param cb function
local function AnimSet(animSet, cb)
	if not HasAnimSetLoaded(animSet) then
		RequestAnimSet(animSet)
		while not HasAnimSetLoaded(animSet) do
			Wait(0)
		end
	end
	if cb then cb() end
end

--- sl.request.model
---@param modelHash any
---@param cb function
---@return any
local function Model(modelHash, cb)
	sl.visual.loading(true, ("Chargement du modèle %s"):format(modelHash), 4)
    modelHash = (type(modelHash) == "number" and modelHash or joaat(modelHash))
	if (not (IsModelInCdimage(modelHash))) then
        return sl.log.print(1, 'Modèle non trouvé %s', modelHash)
    end
    if (HasModelLoaded(modelHash)) then
        sl.visual.loading(false)
        return (modelHash)
    end
	sl.visual.loading(true, ("Chargement du modèle %s"):format(modelHash), 4)
	RequestModel(modelHash)
    while (not HasModelLoaded(modelHash)) do
        Wait(0)
    end
	sl.visual.loading(false)
    if cb then cb(modelHash) end
    return modelHash
end

--- sl.request.movie
---@param movieName any
---@param cb function
---@return any
local function Movie(movieName, cb)
    local scaleform = RequestScaleformMovie(movieName)
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    return scaleform
end

--- sl.request.named_pftx_asset
---@param assetName string
---@param cb function
local function NamedPtfxAsset(assetName, cb)
	if not HasNamedPtfxAssetLoaded(assetName) then
		RequestNamedPtfxAsset(assetName)
		while not HasNamedPtfxAssetLoaded(assetName) do
			Wait(0)
		end
	end
	if cb then cb() end
end

--- sl.request.streamed_texture_dict
---@param textureDict string
---@param cb function
local function StreamedTextureDict(textureDict, cb)
	if not HasStreamedTextureDictLoaded(textureDict) then
		RequestStreamedTextureDict(textureDict)
		while not HasStreamedTextureDictLoaded(textureDict) do
			Wait(0)
		end
	end
	if cb then cb() end
end

--- sl.request.weapon_asset
---@param weaponHash any
---@param cb function
local function WeaponAsset(weaponHash, cb)
	if not HasWeaponAssetLoaded(weaponHash) then
		RequestWeaponAsset(weaponHash)
		while not HasWeaponAssetLoaded(weaponHash) do
			Wait(0)
		end
	end
	if cb then cb() end
end

return {
    anim_dict = AnimDict,
    anim_set = AnimSet,
    model = Model,
    movie = Movie,
    named_pftx_asset = NamedPtfxAsset,
    streamed_texture_dict = StreamedTextureDict,
    weapon_asset = WeaponAsset
}