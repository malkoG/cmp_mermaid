local Source = {}

function Source:new()
  local self = setmetatable({}, { __index = Source })
  self.trigger_characters = { "!" }
  self.trigger_characters_str = table.concat(self.trigger_characters, "")
  self.keyword_pattern = [[\!\.\*]]
  return self
end

function Source:is_available()
  return true
end

function Source:get_debug_name()
  return 'cmp::mermaid'
end

function Source:get_keyword_pattern()
  return self.keyword_pattern
end

function Source:get_trigger_characters()
  return self.trigger_characters
end


local generate_entry = function(label, trigger)
  return { label = label, word = label, insertText = label, filterText = trigger  }
end

local items = {
  generate_entry("wow", "!!wow"),
  generate_entry("foo", "!!bar"),
  generate_entry("bar", "!!baz"),
  generate_entry("lorem", "!!ipsum"),
}

function Source:complete(params, callback)
  callback(items)
end

-- source.resolve  = function()
-- end
--
-- source.execute  = function()
-- end

return Source
