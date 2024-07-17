local openssl_bn       = require("resty.openssl.bn")
local openssl_rd       = require("resty.openssl.rand")
local openssl_dg       = require("resty.openssl.digest")

local lfs     = require('lfs')
local utils   = {}
local sf      = string.format

function utils.require_module(module_name)
    local path = "modules/" .. module_name
    local module = {model = nil, controller = nil, router = nil, views = {}}

    -- load modules files
    for file in lfs.dir(path) do
        if file:match("%.lua") then
            local component = file:gsub(".lua", "")
            module[component] = require(string.gsub(path .. sf(".%s", component), "/", "."))
        elseif file:match("%.etlua") then
            local view = file:gsub(".etlua", "")
            module.views[view] = require(path .. sf(".%s", view))
        end
    end

    return module
end

function utils.hex_to_rgba(hex, opacity)
    hex = hex:gsub("#","")
    local r,g,b = tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
    return string.format('rgba(%d, %d, %d, %.2f)', r, g, b, opacity)
end

function utils.calculate_verifier(username, password, salt)
    local g = openssl_bn.new(7)  -- Set the constant 'g' to 7
    local N = openssl_bn.from_hex("894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7", 16)  -- Set the constant 'N' using hexadecimal representation

    -- Calculate the first hash (h1)
    local sha_username_password = openssl_dg.new("SHA1", true)
    sha_username_password:update(string.upper(string.upper(username) .. ':' .. string.upper(password)))
    sha_username_password = sha_username_password:final()

    -- Calculate the second hash (h2)
    local sha_salt = openssl_dg.new("SHA1", true)
    sha_salt:update(salt .. sha_username_password)
    sha_salt = sha_salt:final()

    local sha_salt_endian = utils.reverse_endian(sha_salt)

    -- Calculate g^h2 mod N
    local sha_salt_bn = openssl_bn.from_binary(sha_salt_endian)
    local verifier_bn = openssl_bn.mod_exp(g, sha_salt_bn, N)
    local verifier_bin = openssl_bn.to_binary(verifier_bn)

    -- Convert the verifier to a byte array (little-endian) and pad it to 32 bytes
    local verifier = utils.reverse_endian(verifier_bin)
    return verifier or nil
end

function utils.generate_salt()
    return openssl_rd.bytes(32)
end

function utils.reverse_endian(str)
    local reversed = ""
    for i = #str, 1, -1 do
        reversed = reversed .. string.char(str:byte(i))
    end

    return reversed
end

return utils
