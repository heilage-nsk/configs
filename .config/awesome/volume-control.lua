local unpack = unpack or table.unpack
local awful = require("awful")
local wibox = require("wibox")

-- Volume Control

-- vcontrol.mt: module (class) metatable
-- vcontrol.wmt: widget (instance) metatable
local vcontrol = { mt = {}, wmt = {} }
vcontrol.wmt.__index = vcontrol


------------------------------------------
-- Private utility functions
------------------------------------------

local function readcommand(command)
    local file = io.popen(command)
    local text = file:read('*all')
    file:close()
    return text
end

local function quote_arg(str)
    return "'" .. string.gsub(str, "'", "'\\''") .. "'"
end

local function quote_args(first, ...)
    if #{...} == 0 then
        return quote_arg(first)
    else
        return quote_arg(first), quote_args(...)
    end
end

local function make_argv(...)
    return table.concat({quote_args(...)}, " ")
end


------------------------------------------
-- Volume control interface
------------------------------------------

function vcontrol.new(args)
    local sw = setmetatable({}, vcontrol.wmt)

    sw.cmd = "pactl"
    sw.channel = args.channel or "0"
    sw.step = args.step or '5%'
    sw.lclick = args.lclick or "toggle"
    sw.mclick = args.mclick or "pavucontrol"
    sw.rclick = args.rclick or "pavucontrol"

    sw.widget = wibox.widget.textbox()
    sw.widget.set_align("right")

    sw.widget:buttons(awful.util.table.join(
        awful.button({}, 1, function() sw:action(sw.lclick) end),
        awful.button({}, 2, function() sw:action(sw.mclick) end),
        awful.button({}, 3, function() sw:action(sw.rclick) end),
        awful.button({}, 4, function() sw:up() end),
        awful.button({}, 5, function() sw:down() end)
    ))

    sw.timer = timer({ timeout = args.timeout or 0.5 })
    sw.timer:connect_signal("timeout", function() sw:get() end)
    sw.timer:start()
    sw:get()

    return sw
end

function vcontrol:action(action)
    if action == nil then
        return
    end
    if type(action) == "function" then
        action(self)
    elseif type(action) == "string" then
        if self[action] ~= nil then
            self[action](self)
        else
            awful.spawn(action)
        end
    end
end

function vcontrol:update(status)
    local volume = string.format("% 3d", status)
    self.widget:set_text(" |  " .. volume .. "% | ")
end

function vcontrol:mixercommand(...)
    local args = awful.util.table.join(
      {self.cmd},
      {...})
    local command = make_argv(unpack(args))
    return readcommand(command)
end

function vcontrol:volumeget()
    local cStr = string.format("%d", self.channel)
    return readcommand("SINK=" .. cStr .. " getvolume")
end

function vcontrol:get()
    self:update(self:volumeget())
end

function vcontrol:up()
    self:mixercommand("set-sink-volume", self.channel, "+" .. self.step)
    self:update(self:volumeget())
end

function vcontrol:down()
    self:mixercommand("set-sink-volume", self.channel, "-" .. self.step)
    self:update(self:volumeget())
end

function vcontrol:toggle()
    self:mixercommand("set-sink-volume", self.channel, "0")
    self:update(self:volumeget())
end

function vcontrol:mute()
    self:mixercommand("set-sink-volume", self.channel, "0")
    self:update(self:volumeget())
end

function vcontrol.mt:__call(...)
    return vcontrol.new(...)
end

return setmetatable(vcontrol, vcontrol.mt)

